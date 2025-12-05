import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/providers/router_provider.dart';
import 'package:fspace/router.dart';
import 'package:fspace/theme.dart';
import 'package:pro_image_editor/core/models/editor_callbacks/pro_image_editor_callbacks.dart';
import 'package:pro_image_editor/core/models/editor_configs/pro_image_editor_configs.dart';
import 'package:pro_image_editor/core/models/init_configs/crop_rotate_editor_init_configs.dart';
import 'package:pro_image_editor/features/crop_rotate_editor/crop_rotate_editor.dart';
import 'package:pro_image_editor/shared/widgets/reactive_widgets/reactive_custom_appbar.dart';
import 'package:pro_image_editor/shared/widgets/reactive_widgets/reactive_custom_widget.dart';

class PhotoCropPage extends HookConsumerWidget {
  final String path;
  final int? cropX;
  final int? cropY;
  final Function(Map<String, dynamic> result)? onSelect;

  const PhotoCropPage(
      {super.key, required this.path, this.cropX, this.cropY, this.onSelect});

  double? get aspectRatio {
    if (cropX != null && cropY != null && cropX! > 0 && cropY! > 0) {
      return cropX!.toDouble() / cropY!.toDouble();
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowLoading = useState(false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: kSystemUiOverlayLightStyle,
        child: CropRotateEditor.file(
          File(path),
          initConfigs: CropRotateEditorInitConfigs(
            theme: Theme.of(context),
            convertToUint8List: true,
            callbacks: ProImageEditorCallbacks(
              onImageEditingComplete: (data) async {
                // 创建一个临时文件路径来保存处理后的图片
                final String directory = Directory.systemTemp.path;
                final String fileName =
                    'edited_${DateTime.now().millisecondsSinceEpoch}.jpg';
                final File file = File('$directory/$fileName');
                // 将 Uint8List 写入文件
                await file.writeAsBytes(data);
                // 回调处理完成的文件
                debugPrint(
                    "onImageEditingComplete: 图片已保存到 ${file.path}, 原始路径: $path");
                onSelect
                    ?.call({'croppedPath': file.path, 'originalPath': path});
              },
              onCloseEditor: (editorMode) {
                final list = ref
                    .read(routerProvider)
                    .routerDelegate
                    .currentConfiguration
                    .matches;
                list.removeWhere(
                    (e) => e.matchedLocation == PhotoPreviewRoute().location);
                context.pop({'originalPath': path});
              },
              cropRotateEditorCallbacks: CropRotateEditorCallbacks(
                onInit: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    isShowLoading.value = true;
                  });
                },
                onUpdateUI: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    isShowLoading.value = false;
                  });
                },
              ),
            ),
            configs: ProImageEditorConfigs(
              i18n: I18n(
                doneLoadingMsg: t.photoCrop.cropLoad,
              ),
              dialogConfigs: DialogConfigs(
                style: DialogStyle(
                  loadingDialog: LoadingDialogStyle(
                    textColor: Colors.black,
                  ),
                ),
              ),
              cropRotateEditor: CropRotateEditorConfigs(
                enabled: false,
                initAspectRatio: aspectRatio,
                style: CropRotateEditorStyle(
                  // 背景
                  background: Colors.black,
                  // 四角
                  cropCornerColor: Colors.white,
                  // 遮罩
                  // cropOverlayColor: Colors.red,
                  // 辅助线
                  helperLineColor: Colors.white,
                  // 四角宽度
                  cropCornerThickness: 2,
                  // 四角长度
                  cropCornerLength: 50,
                ),
                widgets: CropRotateEditorWidgets(
                  bottomBar: _bottomBar,
                  appBar: _appBar,
                  bodyItems: (state, stream) =>
                      _bodyItems(state, stream, isShowLoading),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ReactiveWidget<Widget> _bottomBar(
      CropRotateEditorState state, Stream<void> stream) {
    return ReactiveWidget(
      stream: stream,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 13, left: 16, right: 16),
              child: Text(
                t.photoCrop.cropTips,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 68,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    color: Colors.transparent,
                    onPressed: ctx.pop,
                    child: Text(
                      t.common.cancel,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    color: Colors.transparent,
                    onPressed: state.done,
                    child: Text(
                      t.common.done,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  ReactiveAppbar _appBar(CropRotateEditorState state, Stream<void> stream) {
    return ReactiveAppbar(
      stream: stream,
      builder: (ctx) {
        return PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox.shrink(),
        );
      },
    );
  }

  List<ReactiveWidget<Widget>> _bodyItems(CropRotateEditorState state,
      Stream<void> stream, ValueNotifier<bool> isShowLoading) {
    return [
      if (isShowLoading.value)
        ReactiveWidget(
          stream: stream,
          builder: (ctx) {
            return Center(
              child:
                  CupertinoActivityIndicator(color: Colors.white, radius: 12),
            );
          },
        ),
    ];
  }
}
