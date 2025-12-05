import 'dart:ui';

import 'package:fspace/app.dart';
import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/base/widgets/toast.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/managers/permission_manager.dart';
import 'package:fspace/modules/album/limmit_permission_tip_widget.dart';
import 'package:fspace/theme.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:fspace/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/cupertino.dart';

final String _tag = 'VideoPreviewPage';

/// 相册预览页面-视频选择
class VideoPreviewPage extends HookConsumerWidget {
  const VideoPreviewPage({
    super.key,
    this.minSelectCount = 1,
    this.maxSelectCount = 1,
  });

  /// 最小选择数量
  final int minSelectCount;

  /// 最大选择数量
  final int maxSelectCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    final hasMore = useState<bool>(true);
    final assets = useState<List<AssetEntity>>([]);
    final page = useState<int>(0);
    const pageSize = 120; // 单页加载数量，兼顾性能与首屏速度
    /// 是否有有限的访问权限
    final limitedAccess = useState<bool>(false);

    // 选中元素List
    final selItemList = useState<List<AssetEntity>>([]);

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
      Logger.debug('开始加载第$nextPage页视频，每页$pageSize个');
      final chunk =
          await path.getAssetListPaged(page: nextPage, size: pageSize);
      Logger.debug('加载到${chunk.length}个视频');
      if (chunk.isEmpty) {
        Logger.debug('没有更多视频了');
        hasMore.value = false;
      } else {
        // 延迟缓存请求，避免阻塞UI
        Future.delayed(const Duration(milliseconds: 360), () {
          PhotoCachingManager()
              .requestCacheAssets(assets: chunk, option: option);
        });
        assets.value = [...assets.value, ...chunk];
        page.value = nextPage + 1;
        Logger.debug('当前总共有${assets.value.length}个视频');
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

        Logger.debug('开始获取视频相册列表...');
        // 修改：获取所有相册路径（包含"所有视频"）
        final paths = await PhotoManager.getAssetPathList(
          hasAll: true,
          onlyAll: false,
          type: RequestType.video,
          filterOption: group,
        );

        Logger.debug('获取到${paths.length}个视频相册');
        if (paths.isEmpty) {
          Logger.warning('没有找到任何视频相册');
          hasMore.value = false;
          return;
        }

        albumPaths.value = paths;
        pathEntity.value = paths.first; // "所有视频" 或系统返回的第一个相册
        Logger.debug(
            '选择相册: ${paths.first.name}, 视频数量: ${await paths.first.assetCountAsync}');

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
      } catch (e) {
        Logger.error('初始化视频列表失败: $e');
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

    // 移除依赖 isLoading 的二次触发逻辑，直接在滚动事件中触发加载

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
                    selItemList,
                    init,
                    minSelectCount,
                    maxSelectCount,
                  ),
                  _loadingFooter(
                    context,
                    isPaging,
                    hasMore,
                  ),
                  _safeBottom(context),
                ],
              ),

              // 底部自定义Widget
              _customBottomWidget(
                context,
                selItemList,
                minSelectCount,
                maxSelectCount,
              ),

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
  ValueNotifier<List<AssetEntity>> selItemList,
  Future<void> Function() init,
  int minSelectCount,
  int maxSelectCount,
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
              await PhotoManager.presentLimited(type: RequestType.video);
              init();
            },
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  t.videoPreview.addMore,
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
          return GestureDetector(
            child: _AssetTile(
              entity: entity,
              option: option,
              selItemList: selItemList,
            ),
            onTap: () async {
              final originFile = await entity.originFile;
              Logger.warning('点击pic: ${originFile?.path}');
              if (originFile != null && context.mounted) {
                final currentSelected = selItemList.value;
                final isCurrentlySelected =
                    currentSelected.any((asset) => asset.id == entity.id);

                if (isCurrentlySelected) {
                  // 不校验取消
                  selItemList.value = currentSelected
                      .where((asset) => asset.id != entity.id)
                      .toList();

                  // // 取消选中：检查是否低于最小选择数量
                  // if (currentSelected.length > minSelectCount) {
                  //   selItemList.value = currentSelected
                  //       .where((path) => path != originFile.path)
                  //       .toList();
                  // } else {
                  //   // 显示提示：不能少于最小选择数量
                  //   Toast.showMessage('至少需要选择$minSelectCount个项目');
                  // }
                } else {
                  // 选中：检查是否超过最大选择数量
                  if (currentSelected.length < maxSelectCount) {
                    selItemList.value = [...currentSelected, entity];
                  } else {
                    // 显示提示：不能超过最大选择数量
                    Toast.showMessage(t.videoPreview
                        .selectTip(maxSelectCount: maxSelectCount));
                  }
                }
              }
            },
          );
        }
      },
      childCount: assets.value.length + (limitedAccess.value ? 1 : 0),
    ),
  );
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

/// 相册图片单元格
class _AssetTile extends HookWidget {
  const _AssetTile({
    required this.entity,
    required this.option,
    required this.selItemList,
  });

  final AssetEntity entity;
  final ThumbnailOption option;
  final ValueNotifier<List<AssetEntity>> selItemList;

  @override
  Widget build(BuildContext context) {
    // final future = useMemoized(
    //   () => entity.originFile,
    //   [entity.id],
    // );
    // final originFileSnapshot = useFuture(future);

    final thumbnailFuture = useMemoized(
      () => entity.thumbnailDataWithOption(option),
      [entity.id],
    );
    final thumbnailSnapshot = useFuture(thumbnailFuture);

    if (thumbnailSnapshot.connectionState != ConnectionState.done) {
      return Container(color: const Color(0xFFF2F2F2));
    }

    final bytes = thumbnailSnapshot.data;
    if (bytes == null) {
      return Container(color: const Color(0xFFF2F2F2));
    }

    // 判断当前视频是否被选中
    // final originFile = originFileSnapshot.data;
    final isSelected = selItemList.value.any((asset) => asset.id == entity.id);
    final selectedIndex = isSelected
        ? selItemList.value.indexWhere((asset) => asset.id == entity.id) + 1
        : 0;

    return Stack(
      children: [
        // 视频封面
        Positioned.fill(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.memory(
              bytes,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 选中状态的圆圈显示
        Positioned(
          top: 6,
          right: 6,
          child: IgnorePointer(
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFFFD860) : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1.5,
                  color: context.appColors.textMain,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Text(
                        selectedIndex.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),

        // 右下角视频时长
        Positioned(
          right: 6,
          bottom: 4,
          child: Text(
            // 视频时长
            _formatDuration(entity.duration),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

/// 底部安全区占位
/// 需要根据底部_customBottomWidget实际情况调整height高度
Widget _safeBottom(BuildContext context) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 12 + 28 + 16 + 56 + ScreenUtils.instance.bottomBarHeight + 30,
    ),
  );
}

/// 底部自定义Widget
Widget _customBottomWidget(
  BuildContext context,
  ValueNotifier<List<AssetEntity>> selItemList,
  int minSelectCount,
  int maxSelectCount,
) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          // height: 100,
          padding: EdgeInsets.only(
            left: 16,
            top: 12,
            right: 16,
            bottom: ScreenUtils.instance.bottomBarHeight + 30,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
          ),
          child: Column(
            children: [
              // Title
              SizedBox(
                height: 28,
                child: Row(
                  children: [
                    Text(
                      minSelectCount == maxSelectCount
                          ? t.videoPreview.selectTitle1(count: minSelectCount)
                          : t.videoPreview.selectTitle2(
                              minCount: minSelectCount,
                              maxCount: maxSelectCount,
                              count: selItemList.value.length),
                      style: TextStyle(
                        fontSize: 14,
                        color: context.appColors.textMain,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    CustomContainer(
                      onTap: () {},
                      enable: selItemList.value.length >= minSelectCount &&
                          selItemList.value.length <= maxSelectCount,
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFFFD860),
                      disabledBgColor: Colors.grey.withValues(alpha: 0.2),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Text(t.videoPreview.next),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),

              // 选中横向list预览
              SizedBox(
                height: 56 + 12,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: selItemList.value.length,
                  itemBuilder: (context, index) {
                    final asset = selItemList.value[index];
                    return _SelectedAssetTile(
                      key: ValueKey(asset.id), // 添加唯一key避免重建
                      asset: asset,
                      index: index,
                      onRemove: () {
                        selItemList.value = selItemList.value
                            .where((item) => item.id != asset.id)
                            .toList();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
  ValueNotifier<double> rotationTurns, {
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
                                  String albumTitle = t.videoPreview.allVideo;
                                  if (pathEntity.value?.name != null &&
                                      pathEntity.value!.name.isNotEmpty &&
                                      pathEntity.value!.name != 'Recent') {
                                    albumTitle = pathEntity.value!.name;
                                  } else if (pathEntity.value?.name ==
                                      'Recent') {
                                    albumTitle = t.videoPreview.allVideo;
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
                                  String albumTitle = t.videoPreview.allVideo;
                                  if (path.name != 'Recent') {
                                    albumTitle = path.name;
                                  } else if (path.name == 'Recent') {
                                    albumTitle = t.videoPreview.allVideo;
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

// 格式化视频时长
String _formatDuration(int seconds) {
  final minutes = seconds ~/ 60;
  final remainingSeconds = seconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

/// 选中的资源缩略图组件，使用缓存避免重复请求
class _SelectedAssetTile extends HookWidget {
  const _SelectedAssetTile({
    super.key,
    required this.asset,
    required this.index,
    required this.onRemove,
  });

  final AssetEntity asset;
  final int index;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    // 使用useMemoized缓存future，避免重复请求
    final thumbnailFuture = useMemoized(
      () => asset.thumbnailDataWithOption(
        const ThumbnailOption(
          size: ThumbnailSize(56 * 2, 56 * 2),
          format: ThumbnailFormat.jpeg,
          quality: 100,
        ),
      ),
      [asset.id], // 只有asset.id变化时才重新创建future
    );

    final snapshot = useFuture(thumbnailFuture);

    return Container(
      width: 56 + 12,
      height: 56 + 12,
      margin: EdgeInsets.only(right: 10),
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 56,
              height: 56,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Stack(
                children: [
                  // 选中图片压缩预览图
                  Positioned.fill(
                    child: snapshot.hasData && snapshot.data != null
                        ? Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.grey.withValues(alpha: 0.3),
                            child: Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                  ),
                  // Cover左上角角标
                  Positioned(
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: context.appColors.textMain,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 右下角视频时长
                  Positioned(
                    right: 6,
                    bottom: 4,
                    child: Text(
                      // 视频时长
                      _formatDuration(asset.duration),
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 右上角关闭icon
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                color: Colors.transparent,
                width: 24,
                height: 24,
                padding: EdgeInsets.all(4),
                child: Image.asset(
                  Assets.images.selPicCancel.path,
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
