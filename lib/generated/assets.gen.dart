// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Black.ttf
  String get harmonyOSSansSCBlack => 'assets/fonts/HarmonyOS_Sans_SC_Black.ttf';

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Bold.ttf
  String get harmonyOSSansSCBold => 'assets/fonts/HarmonyOS_Sans_SC_Bold.ttf';

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Light.ttf
  String get harmonyOSSansSCLight => 'assets/fonts/HarmonyOS_Sans_SC_Light.ttf';

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Medium.ttf
  String get harmonyOSSansSCMedium =>
      'assets/fonts/HarmonyOS_Sans_SC_Medium.ttf';

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Regular.ttf
  String get harmonyOSSansSCRegular =>
      'assets/fonts/HarmonyOS_Sans_SC_Regular.ttf';

  /// File path: assets/fonts/HarmonyOS_Sans_SC_Thin.ttf
  String get harmonyOSSansSCThin => 'assets/fonts/HarmonyOS_Sans_SC_Thin.ttf';

  /// List of all assets
  List<String> get values => [
        harmonyOSSansSCBlack,
        harmonyOSSansSCBold,
        harmonyOSSansSCLight,
        harmonyOSSansSCMedium,
        harmonyOSSansSCRegular,
        harmonyOSSansSCThin
      ];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/logo.jpeg
  AssetGenImage get logo => const AssetGenImage('assets/icon/logo.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/close.png
  AssetGenImage get close => const AssetGenImage('assets/images/close.png');

  /// File path: assets/images/icon_album.png
  AssetGenImage get iconAlbum =>
      const AssetGenImage('assets/images/icon_album.png');

  /// File path: assets/images/sel_pic_cancel.png
  AssetGenImage get selPicCancel =>
      const AssetGenImage('assets/images/sel_pic_cancel.png');

  /// List of all assets
  List<AssetGenImage> get values => [close, iconAlbum, selPicCancel];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/loading.json
  String get loading => 'assets/lotties/loading.json';

  /// File path: assets/lotties/make_loading.json
  String get makeLoading => 'assets/lotties/make_loading.json';

  /// File path: assets/lotties/turn.json
  String get turn => 'assets/lotties/turn.json';

  /// List of all assets
  List<String> get values => [loading, makeLoading, turn];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/icon_back.svg
  String get iconBack => 'assets/svg/icon_back.svg';

  /// File path: assets/svg/icon_barcode.svg
  String get iconBarcode => 'assets/svg/icon_barcode.svg';

  /// File path: assets/svg/icon_close.svg
  String get iconClose => 'assets/svg/icon_close.svg';

  /// File path: assets/svg/icon_close_1.svg
  String get iconClose1 => 'assets/svg/icon_close_1.svg';

  /// File path: assets/svg/icon_down.svg
  String get iconDown => 'assets/svg/icon_down.svg';

  /// File path: assets/svg/icon_right.svg
  String get iconRight => 'assets/svg/icon_right.svg';

  /// File path: assets/svg/icon_select.svg
  String get iconSelect => 'assets/svg/icon_select.svg';

  /// File path: assets/svg/icon_setting.svg
  String get iconSetting => 'assets/svg/icon_setting.svg';

  /// File path: assets/svg/make_same_bottom_right_star.svg
  String get makeSameBottomRightStar =>
      'assets/svg/make_same_bottom_right_star.svg';

  /// File path: assets/svg/make_same_magic.svg
  String get makeSameMagic => 'assets/svg/make_same_magic.svg';

  /// File path: assets/svg/make_same_quote.svg
  String get makeSameQuote => 'assets/svg/make_same_quote.svg';

  /// File path: assets/svg/make_same_top_left_star.svg
  String get makeSameTopLeftStar => 'assets/svg/make_same_top_left_star.svg';

  /// File path: assets/svg/photo_permission.svg
  String get photoPermission => 'assets/svg/photo_permission.svg';

  /// List of all assets
  List<String> get values => [
        iconBack,
        iconBarcode,
        iconClose,
        iconClose1,
        iconDown,
        iconRight,
        iconSelect,
        iconSetting,
        makeSameBottomRightStar,
        makeSameMagic,
        makeSameQuote,
        makeSameTopLeftStar,
        photoPermission
      ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
