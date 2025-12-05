import 'dart:io';
import 'dart:ui';

import 'package:fspace/app.dart';
import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/managers/permission_manager.dart';
import 'package:fspace/managers/recently_use_image_manager.dart';
import 'package:fspace/modules/album/limmit_permission_tip_widget.dart';
import 'package:fspace/router.dart';
import 'package:fspace/theme.dart';
import 'package:fspace/utils/image_utils.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:fspace/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/cupertino.dart';

/// 相册预览页面-选择单张
class PhotoPreviewPage extends HookConsumerWidget {
  final bool forceCut;
  final int? cropX;
  final int? cropY;
  final Function(Map<String, dynamic> result)? onSelect;
  const PhotoPreviewPage(
      {super.key,
      this.forceCut = false,
      this.cropX,
      this.cropY,
      this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    final hasMore = useState<bool>(true);
    final assets = useState<List<AssetEntity>>([]);
    final page = useState<int>(0);
    const pageSize = 120; // 单页加载数量，兼顾性能与首屏速度
    /// 是否有有限的访问权限
    final limitedAccess = useState<bool>(false);

    final option = useMemoized(
      () => const ThumbnailOption(
        size: ThumbnailSize(200, 200),
        format: ThumbnailFormat.jpeg,
        quality: 80, // 降低质量以提升加载速度
      ),
      const [],
    );

    final scrollController = useScrollController();
    final pathEntity = useState<AssetPathEntity?>(null);
    final isPaging = useState<bool>(false);
    // 新增：相册列表与下拉开关
    final albumPaths = useState<List<AssetPathEntity>>([]);
    final isAlbumOpen = useState<bool>(false);
    final albumThumbCache = useState<Map<String, Uint8List?>>({});
    final rotationTurns = useState<double>(0.0);

    /// 是否显示最近使用图片
    final isShowBottom = useState<bool>(false);

    // 在 effect 之前定义分页加载方法，避免前向引用
    Future<void> loadMoreFn() async {
      if (!hasMore.value) return;
      if (isPaging.value) return; // 防并发
      final path = pathEntity.value;
      if (path == null) return;

      // 将滚动触发的加载标记复位
      if (isLoading.value) {
        isLoading.value = false;
      }

      isPaging.value = true;
      final nextPage = page.value;
      final chunk =
          await path.getAssetListPaged(page: nextPage, size: pageSize);
      if (chunk.isEmpty) {
        hasMore.value = false;
      } else {
        // 延迟缓存请求，避免阻塞UI
        Future.delayed(const Duration(milliseconds: 360), () {
          PhotoCachingManager()
              .requestCacheAssets(assets: chunk, option: option);
        });
        assets.value = [...assets.value, ...chunk];
        page.value = nextPage + 1;
      }
      isPaging.value = false;
    }

    useEffect(() {
      void onScroll() {
        final position = scrollController.position;
        if (!position.hasPixels || isPaging.value || !hasMore.value) return;
        final threshold = position.maxScrollExtent * 0.85;
        if (position.pixels >= threshold) {
          // 直接在滚动事件中触发分页加载，避免二次状态触发
          loadMoreFn();
        }
      }

      scrollController.addListener(onScroll);
      return () {
        scrollController.removeListener(onScroll);
        PhotoCachingManager().cancelCacheRequest();
      };
    }, [scrollController, isPaging.value, hasMore.value]);

    Future<void> init() async {
      isLoading.value = true;
      try {
        final group = FilterOptionGroup(
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        );

        // 修改：获取所有相册路径（包含“所有照片”）
        final paths = await PhotoManager.getAssetPathList(
          hasAll: true,
          onlyAll: false,
          type: RequestType.image,
          filterOption: group,
        );

        if (paths.isEmpty) {
          hasMore.value = false;
          return;
        }

        albumPaths.value = paths;
        pathEntity.value = paths.first; // “所有照片” 或系统返回的第一个相册
        page.value = 0;
        assets.value = [];
        hasMore.value = true;
        await loadMoreFn();
        // 预取相册封面缓存（不阻塞首屏）
        Future.microtask(() async {
          final map = <String, Uint8List?>{};
          for (final p in albumPaths.value) {
            try {
              final bytes = await _firstThumb(p, option);
              map[p.id] = bytes;
            } catch (_) {}
          }
          albumThumbCache.value = {...albumThumbCache.value, ...map};
        });
      } finally {
        isLoading.value = false;
        isPaging.value = false;
      }
    }

    // 原始方法保留供其他调用，但不在前向引用位置使用
    Future<void> loadMore() async {
      await loadMoreFn();
    }

    useEffect(() {
      // 相册部分权限判定
      PermissionManager.isPhotoLimitPermission().then((value) {
        limitedAccess.value = value;
      });

      // 延迟初始化，确保路由动画流畅
      Future.delayed(const Duration(milliseconds: 360), init);

      return null;
    }, const []);

    // 直接在滚动事件中触发分页加载，移除依赖 isLoading 的二次触发逻辑

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: kSystemUiOverlayStyle,
        child: PopScope(
          canPop: !isAlbumOpen.value,
          onPopInvokedWithResult: (didPop, result) {
            // 如果相册下拉面板打开，拦截返回并先关闭面板；否则正常返回页面
            if (!didPop && isAlbumOpen.value) {
              rotationTurns.value += 0.5;
              isAlbumOpen.value = false;
            }
          },
          child: Stack(
            children: [
              // 相册预览列表
              CustomScrollView(
                controller: scrollController,
                cacheExtent: 8000,
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  _safeHeader(context, limitedAccess),
                  _photoPreviewGrid(
                    context,
                    assets,
                    option,
                    limitedAccess,
                    init,
                  ),
                  _loadingFooter(context, isPaging, hasMore),
                  _safeBottom(context, isShowBottom),
                ],
              ),

              // 底部自定义Widget
              _customBottomWidget(context, isShowBottom),

              // 部分授权
              _limmitPermissonTipWidget(context, limitedAccess),

              // 自定义AppBar + 相册下拉面板
              _customAppBarAndAlbumDropdownOverlay(
                context,
                albumPaths.value,
                option,
                pathEntity,
                isAlbumOpen,
                albumThumbCache,
                rotationTurns,
                limitedAccess,
                onSelect: (selected) async {
                  rotationTurns.value += 0.5;
                  isAlbumOpen.value = false;
                  if (pathEntity.value?.id == selected.id) return;
                  isLoading.value = true;
                  try {
                    // 切换相册时，先直接跳到顶部，避免回弹动画
                    if (scrollController.hasClients) {
                      scrollController.jumpTo(0);
                    }
                    pathEntity.value = selected;
                    page.value = 0;
                    assets.value = [];
                    hasMore.value = true;
                    await loadMoreFn();
                  } finally {
                    isLoading.value = false;
                    isPaging.value = false;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 自定义AppBar
  PreferredSizeWidget _customAppBar(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return MAppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.8),
      enabledBackdrop: true,
      enabledBottomLine: false,
      child: Center(
        child: CustomContainer(
          margin: const EdgeInsets.symmetric(vertical: 8),
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Container(
            width: 200,
            height: double.infinity,
            color: Colors.grey.withValues(alpha: 0.1),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: context.appColors.textMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 顶部安全区占位
  Widget _safeHeader(BuildContext context, ValueNotifier<bool> limitedAccess) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: ScreenUtils.instance.statusBarHeight +
            kToolbarHeight +
            (limitedAccess.value
                ? limitTipHeight
                : 0), // 顶部安全区 + AppBar高度 + 部分授权Tip
      ),
    );
  }

  /// 相册略缩图片列表
  Widget _photoPreviewGrid(
    BuildContext context,
    ValueNotifier<List<AssetEntity>> assets,
    ThumbnailOption option,
    ValueNotifier<bool> limitedAccess,
    Future<void> Function() init,
  ) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (limitedAccess.value && index == assets.value.length) {
            return InkWell(
              onTap: () async {
                await PhotoManager.presentLimited(type: RequestType.image);
                init();
              },
              child: Container(
                color: Colors.grey,
                child: Center(
                  child: Text(
                    t.photoPreview.addMore,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            if (index >= assets.value.length) {
              return const SizedBox.shrink();
            }
            final entity = assets.value[index];
            return InkWell(
              child: _AssetTile(entity: entity, option: option),
              onTap: () async {
                final File? file = await ImageUtils.getSelectedPicFile(entity);
                if (file == null || !context.mounted) return;
                // 回调处理完成的文件
                onTapPic(context, file.path);
              },
            );
          }
        },
        childCount: assets.value.length + (limitedAccess.value ? 1 : 0),
      ),
    );
  }

  void onTapPic(BuildContext context, String picPath) {
    if (forceCut) {
      PhotoCropRoute(
          path: picPath,
          cropX: cropX,
          cropY: cropY,
          $extra: {'onSelect': onSelect}).push(context);
    } else {
      if (cropX != null && cropX! > 0 && cropY != null && cropY! > 0) {
        PhotoCropRoute(
            path: picPath,
            cropX: cropX,
            cropY: cropY,
            $extra: {'onSelect': onSelect}).push(context);
      } else {
        Logger.info('onTapPic: $picPath');
        onSelect?.call({'originalPath': picPath});
        context.pop();
      }
    }
  }

  /// 底部加载指示器
  Widget _loadingFooter(
    BuildContext context,
    ValueNotifier<bool> isPaging,
    ValueNotifier<bool> hasMore,
  ) {
    if (isPaging.value) {
      // 使用SliverFillRemaining填充剩余空间，让指示器居中显示
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CupertinoActivityIndicator(radius: 10),
        ),
      );
    } else {
      // 不显示加载指示器时，使用空的SliverToBoxAdapter
      return SliverToBoxAdapter(
        child: const SizedBox.shrink(),
      );
    }
  }

  /// 底部自定义Widget
  Widget _customBottomWidget(
      BuildContext context, ValueNotifier<bool> isShowBottom) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.8),
            ),
            child: RecentlyUseWidget(
                onTapPic: onTapPic, isShowBottom: isShowBottom),
          ),
        ),
      ),
    );
  }
}

/// 相册图片单元格
class _AssetTile extends HookWidget {
  const _AssetTile({required this.entity, required this.option});

  final AssetEntity entity;
  final ThumbnailOption option;

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(
      () => entity.thumbnailDataWithOption(option),
      [entity.id],
    );
    final snapshot = useFuture(future);

    if (snapshot.connectionState != ConnectionState.done) {
      return Container(color: const Color(0xFFF2F2F2));
    }

    final bytes = snapshot.data;
    if (bytes == null) {
      return Container(color: const Color(0xFFF2F2F2));
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: Image.memory(
        bytes,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// 底部安全区占位
/// 需要根据底部_customBottomWidget实际情况调整height高度
Widget _safeBottom(BuildContext context, ValueNotifier<bool> isShowBottom) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: isShowBottom.value
          ? 12 * 2 + 24 + 75 + ScreenUtils.instance.bottomBarHeight
          : 24,
    ),
  );
}

/// 部分授权Tip
Widget _limmitPermissonTipWidget(
  BuildContext context,
  ValueNotifier<bool> limitedAccess,
) {
  return Positioned(
    right: 0,
    top: ScreenUtils.instance.statusBarHeight + kToolbarHeight,
    child: limitedAccess.value
        ? limmitPermissionTipWidget(context)
        : SizedBox.shrink(),
  );
}

/// 自定义AppBar + 相册下拉面板
Widget _customAppBarAndAlbumDropdownOverlay(
  BuildContext context,
  List<AssetPathEntity> paths,
  ThumbnailOption option,
  ValueNotifier<AssetPathEntity?> pathEntity,
  ValueNotifier<bool> isAlbumOpen,
  ValueNotifier<Map<String, Uint8List?>> albumThumbCache,
  ValueNotifier<double> rotationTurns,
  ValueNotifier<bool> limitedAccess, {
  required Function(AssetPathEntity selected) onSelect,
}) {
  return Positioned(
    left: 0,
    top: 0,
    right: 0,
    child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          color: Colors.white.withValues(alpha: 0.86),
          constraints: BoxConstraints(
            maxHeight: ScreenUtils.instance.screenHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 自定义AppBar
              Container(
                width: ScreenUtils.instance.screenWidth,
                height: kToolbarHeight + ScreenUtils.instance.statusBarHeight,
                padding: EdgeInsets.only(
                  top: ScreenUtils.instance.statusBarHeight,
                ),
                child: Row(
                  children: [
                    CupertinoButton(
                      // padding: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SvgPicture.asset(
                        Assets.svg.iconBack,
                        width: 28,
                        height: 28,
                        colorFilter:
                            ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      ),
                      onPressed: () => context.pop(),
                    ),

                    Expanded(
                      child: Center(
                        child: CustomContainer(
                          scaleValue: 0.994,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            rotationTurns.value += 0.5;
                            isAlbumOpen.value = !isAlbumOpen.value;
                          },
                          child: Container(
                            width: 200,
                            height: 40,
                            color: Colors.grey.withValues(alpha: 0.1),
                            child: Center(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  String albumTitle = t.photoPreview.allPhoto;
                                  if (pathEntity.value?.name != null &&
                                      pathEntity.value!.name.isNotEmpty &&
                                      pathEntity.value!.name != 'Recent') {
                                    albumTitle = pathEntity.value!.name;
                                  } else if (pathEntity.value?.name ==
                                      'Recent') {
                                    albumTitle = t.photoPreview.allPhoto;
                                  }

                                  return Row(
                                    children: [
                                      Opacity(
                                        opacity: 0.0,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child:
                                              Assets.images.iconAlbum.image(),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        albumTitle,
                                        style: TextStyle(
                                          color: context.appColors.textMain,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),

                                      // 随相册选中面板的展开、关闭状态旋转与恢复
                                      Padding(
                                        padding: EdgeInsets.all(6),
                                        child: AnimatedRotation(
                                          turns: rotationTurns.value,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeOutCubic,
                                          alignment: Alignment.center,
                                          child:
                                              Assets.images.iconAlbum.image(),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 48), // 占位，保持居中
                  ],
                ),
              ),

              // 相册下拉面板（仅Y轴高度动画）
              ClipRect(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 360),
                  curve: Curves.easeInOutCubic,
                  alignment: Alignment.topCenter,
                  width: ScreenUtils.instance.screenWidth,
                  height: isAlbumOpen.value
                      ? ScreenUtils.instance.screenHeight -
                          (kToolbarHeight +
                              ScreenUtils.instance.statusBarHeight)
                      : 0,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: paths.length,
                    itemBuilder: (context, index) {
                      final path = paths[index];
                      return CustomContainer(
                        color: Colors.transparent,
                        scale: false,
                        onTap: () => onSelect(path),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              // 封面图（取该相册第一张的缩略图）
                              Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFF2F2F2),
                                ),
                                child: FutureBuilder<Uint8List?>(
                                  future: (isAlbumOpen.value &&
                                          (albumThumbCache.value[path.id] ==
                                              null))
                                      ? _firstThumb(path, option)
                                      : null,
                                  builder: (context, snapshot) {
                                    final bytes = snapshot.data ??
                                        albumThumbCache.value[path.id];
                                    if (bytes != null) {
                                      return Image.memory(bytes,
                                          fit: BoxFit.cover);
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ),

                              const SizedBox(width: 12),

                              // 相册名称
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  String albumTitle = t.photoPreview.allPhoto;
                                  if (path.name != 'Recent') {
                                    albumTitle = path.name;
                                  } else if (path.name == 'Recent') {
                                    albumTitle = t.photoPreview.allPhoto;
                                  }

                                  return Text(
                                    albumTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: context.appColors.textMain,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(width: 12),

                              // 相册中图片数量
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return FutureBuilder(
                                    future: path.assetCountAsync,
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.data == null
                                            ? ''
                                            : snapshot.data.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: context.appColors.textSecond,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),

                              Spacer(),

                              // 只有选中的相册需要显示
                              pathEntity.value?.id == path.id
                                  ? SvgPicture.asset(Assets.svg.iconSelect)
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Future<Uint8List?> _firstThumb(
    AssetPathEntity path, ThumbnailOption option) async {
  final list = await path.getAssetListPaged(page: 0, size: 1);
  if (list.isEmpty) return null;
  return list.first.thumbnailDataWithOption(option);
}

class RecentlyUseWidget extends HookWidget {
  final ValueNotifier<bool> isShowBottom;

  final void Function(BuildContext context, String picPath) onTapPic;
  const RecentlyUseWidget(
      {super.key, required this.isShowBottom, required this.onTapPic});

  @override
  Widget build(BuildContext context) {
    final basePath = useRef('');
    final dataList = useState<List<String>>([]);
    useEffect(() {
      if (Platform.isIOS) {
        getApplicationDocumentsDirectory().then((value) {
          basePath.value = value.path;
          dataList.value = RecentlyUseImageManager.getUseImagePath();
        });
      } else {
        basePath.value = '';
        dataList.value = RecentlyUseImageManager.getUseImagePath();
      }
      return null;
    }, []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isShowBottom.value = dataList.value.isNotEmpty;
      });
      return null;
    }, [dataList.value]);

    // _safeBottom = 12 * 2 + 24 + 75 + ScreenUtils.instance.bottomBarHeight
    return Visibility(
      visible: dataList.value.isNotEmpty,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
              child: Text(
                t.photoPreview.recentlyUse,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 75,
              margin:
                  EdgeInsets.only(bottom: ScreenUtils.instance.bottomBarHeight),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final path = basePath.value + dataList.value[index];
                  final file = File(path);
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7.0, right: 7.0),
                        child: InkWell(
                          onTap: () => onTapPic(context, path),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(file,
                                fit: BoxFit.cover, width: 68, height: 68),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            final List<String> temp = List.from(dataList.value);
                            final path = temp.removeAt(index);
                            dataList.value = temp;
                            RecentlyUseImageManager.deleteRecentlyUseImage(
                                temp, path);
                          },
                          child:
                              Assets.images.close.image(width: 20, height: 20),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: dataList.value.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
