import 'dart:async';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:dartx/dartx.dart';
import 'package:fspace/utils/logger_util.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

final String _tag = 'ImageUtils';

class ImageUtils {
  ImageUtils._();

  //获取图片文件大小
  static Future<double> getFileSizeInMB(File file) async {
    try {
      final bytes = await file.length();
      // 转换为MB (1 MB = 1024 * 1024 bytes)
      final mb = bytes / (1024 * 1024);
      Logger.debug('文件大小: $mb', tag: _tag);
      return mb;
    } catch (e) {
      Logger.error('获取文件大小失败: $e', tag: _tag);
      return 0;
    }
  }

  //压缩图片
  static Future<File?> compressImage(File imageFile) async {
    try {
      // 获取临时目录
      final Directory tempDir = await getTemporaryDirectory();
      final String targetPath = path.join(
        tempDir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}.jpeg',
      );

      // 压缩图片
      final XFile? compressedFile =
          await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path,
        targetPath,
        quality: 60, // 压缩质量 0-100
        // minWidth: 800, // 最小宽度
        // minHeight: 600, // 最小高度
        format: CompressFormat.jpeg,
      );

      if (compressedFile != null) {
        return File(compressedFile.path);
      }
    } catch (e) {
      Logger.error('图片压缩失败: $e', tag: _tag);
    }
    return null;
  }

  /// 获取选中图片文件
  static Future<File?> getSelectedPicFile(AssetEntity asset) async {
    try {
      final String directory = Directory.systemTemp.path;
      final String fileName = 'selectPic_${asset.id.md5}.jpg';
      final File file = File('$directory/$fileName');
      if (file.existsSync()) {
        Logger.debug('选中图片文件已存在: $file', tag: _tag);
        return file;
      } else {
        final thumbnailData = await asset
            .thumbnailDataWithSize(ThumbnailSize(asset.width, asset.height));
        if (thumbnailData != null) {
          // 将 Uint8List 写入文件
          await file.writeAsBytes(thumbnailData);
          Logger.debug('选中图片文件已保存到: $file', tag: _tag);
          return file;
        } else {
          Logger.error('获取选中图片缩略图数据失败', tag: _tag);
          return null;
        }
      }
    } catch (e) {
      Logger.error('获取选中图片文件失败: $e', tag: _tag);
      return null;
    }
  }
}
