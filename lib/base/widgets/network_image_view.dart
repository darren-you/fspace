import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fspace/utils/logger_util.dart';

final String _tag = 'NetworkImageView';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    super.key,
    required this.url,
    this.fit,
    this.width,
    this.height,
    this.placeholder,
    this.alignment,
    this.scale = 1,
    this.gaplessPlayback = false,
    this.onImageLoaded,
  });

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Alignment? alignment;
  final double scale;
  final bool gaplessPlayback;
  final VoidCallback? onImageLoaded;

  @override
  Widget build(BuildContext context) {
    Widget placeholder = this.placeholder ??
        Container(
          width: width,
          height: height,
          color: Colors.transparent,
        );
    if (url.isEmpty || Uri.tryParse(url) == null) {
      return SizedBox(
        width: width,
        height: height,
        child: placeholder,
      );
    }

    if (width == null && height == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double? w;
          double? h;
          if (constraints.maxWidth.isFinite) w = constraints.maxWidth;
          if (constraints.maxHeight.isFinite) h = constraints.maxHeight;
          return _NetworkImage(
            url: url,
            scale: scale,
            fit: fit,
            width: w,
            height: h,
            placeholder: placeholder,
            alignment: alignment,
            onImageLoaded: onImageLoaded,
          );
        },
      );
    }
    return _NetworkImage(
      url: url,
      scale: scale,
      fit: fit,
      width: width,
      height: height,
      placeholder: placeholder,
      alignment: alignment,
      gaplessPlayback: gaplessPlayback,
      onImageLoaded: onImageLoaded,
    );
  }
}

class _NetworkImage extends StatefulWidget {
  const _NetworkImage({
    required this.url,
    required this.scale,
    this.fit,
    this.width,
    this.height,
    this.placeholder,
    this.alignment,
    this.gaplessPlayback = false,
    this.onImageLoaded,
  });

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Alignment? alignment;
  final double scale;
  final bool gaplessPlayback;
  final VoidCallback? onImageLoaded;

  @override
  State<_NetworkImage> createState() => _NetworkImageState();
}

class _NetworkImageState extends State<_NetworkImage> {
  ImageProvider<Object>? _cachedImageProvider;
  String? _cachedUrl;
  int? _cachedWidth;
  int? _cachedHeight;
  double? _cachedScale;
  double? _cachedDevicePixelRatio;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    int? cacheWidth;
    int? cacheHeight;

    if (widget.width != null) {
      cacheWidth = (widget.width! * devicePixelRatio * widget.scale).toInt();
    }
    if (widget.height != null) {
      cacheHeight = (widget.height! * devicePixelRatio * widget.scale).toInt();
    }

    // 检查是否需要重新创建ImageProvider
    final needsRecreate = _cachedImageProvider == null ||
        _cachedUrl != widget.url ||
        _cachedWidth != cacheWidth ||
        _cachedHeight != cacheHeight ||
        _cachedScale != widget.scale ||
        _cachedDevicePixelRatio != devicePixelRatio;

    if (needsRecreate) {
      _hasError = false; // 重置错误状态
      // 缓存当前参数
      _cachedUrl = widget.url;
      _cachedWidth = cacheWidth;
      _cachedHeight = cacheHeight;
      _cachedScale = widget.scale;
      _cachedDevicePixelRatio = devicePixelRatio;

      // 验证URL格式
      final uri = Uri.tryParse(widget.url);
      if (uri == null ||
          (!uri.hasScheme || (uri.scheme != 'http' && uri.scheme != 'https'))) {
        Logger.error('Invalid URL format: ${widget.url}', tag: _tag);
        _cachedImageProvider = NetworkImage(widget.url);
      } else {
        // 创建新的ImageProvider
        try {
          ImageProvider<Object> imageProvider = ExtendedNetworkImageProvider(
            widget.url,
            scale: widget.scale,
            cache: true,
            retries: 3,
            timeRetry: const Duration(milliseconds: 100),
          );

          // 只有在尺寸合理的情况下才使用ResizeImage
          if (cacheWidth != null && cacheWidth > 0 && cacheWidth < 4096 ||
              cacheHeight != null && cacheHeight > 0 && cacheHeight < 4096) {
            imageProvider = ResizeImage(
              imageProvider,
              width: cacheWidth,
              height: cacheHeight,
              policy: ResizeImagePolicy.fit,
            );
          }

          _cachedImageProvider = imageProvider;
        } catch (e) {
          Logger.error('Failed to create image provider for ${widget.url}: $e',
              tag: _tag);
          // 如果创建失败，使用基础的NetworkImage
          _cachedImageProvider = NetworkImage(widget.url);
        }
      }
    }

    return Image(
      image: _cachedImageProvider!,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      alignment: widget.alignment ?? Alignment.center,
      gaplessPlayback: widget.gaplessPlayback,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return widget.placeholder ?? const SizedBox();
        }
        return child;
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          // 只有在没有错误的情况下才调用回调
          if (!_hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.onImageLoaded?.call();
            });
          }
          return child;
        }
        return widget.placeholder ?? const SizedBox();
      },
      errorBuilder: (context, error, stackTrace) {
        _hasError = true;
        Logger.error('Load netimage error: $error stackTrace: $stackTrace',
            tag: _tag);
        return widget.placeholder ?? const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    _cachedImageProvider = null;
    super.dispose();
  }
}
