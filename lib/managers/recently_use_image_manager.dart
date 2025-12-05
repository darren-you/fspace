import 'dart:io';

import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/managers/preferences_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fspace/utils/logger_util.dart';

final String _tag = 'RecentlyUseImageManager';

class RecentlyUseImageManager {
  RecentlyUseImageManager._();

  /// 最近使用图片列表的最大长度限制
  static const int _maxListLength = 100;

  static const String _imageDirName = 'recently_use_image';

  ///保存图片地址到最近使用图片地址列表
  static void saveUseImagePath(List<String> pathList) async {
    try {
      if (Platform.isIOS) {
        List<String> tempPathList = [];
        for (final path in pathList) {
          final imagepath =
              await RecentlyUseImageManager._saveImageToDocument(path);
          String tempPath = imagepath.split('/$_imageDirName/').last;
          tempPath = '/$_imageDirName/$tempPath';
          tempPathList.add(tempPath);
        }

        List<String> imageList = RecentlyUseImageManager.getUseImagePath();

        // 删除重复的图片路径
        imageList.removeWhere((item) => tempPathList.contains(item));
        imageList.insertAll(0, tempPathList);

        // 限制列表长度
        if (imageList.length > _maxListLength) {
          imageList = imageList.sublist(0, _maxListLength);
        }

        PreferencesManager.instance
            .setStringList(PreferencesKeys.recentlyUseImage, imageList);
      } else if (Platform.isAndroid) {
        List<String> tempPathList = [];
        for (final path in pathList) {
          final imagepath =
              await RecentlyUseImageManager._saveImageToDocument(path);
          tempPathList.add(imagepath);
        }

        Logger.error('android imagepath: $tempPathList', tag: _tag);
        // Android直接使用绝对路径
        List<String> imageList = RecentlyUseImageManager.getUseImagePath();

        // 删除重复的图片路径
        imageList.removeWhere((item) => tempPathList.contains(item));

        imageList.insertAll(0, tempPathList);

        // 限制列表长度
        if (imageList.length > _maxListLength) {
          imageList = imageList.sublist(0, _maxListLength);
        }

        PreferencesManager.instance
            .setStringList(PreferencesKeys.recentlyUseImage, imageList);
      }
    } catch (e) {
      Logger.error('保存最近使用图片失败：${e.toString()}', tag: _tag);
    }
  }

  ///获取最近使用图片地址列表
  static List<String> getUseImagePath() {
    return PreferencesManager.instance
            .getStringList(PreferencesKeys.recentlyUseImage) ??
        [];
  }

  ///保存图片到沙盒
  static Future<String> _saveImageToDocument(String path) async {
    File tempFile = File(path);
    if (!tempFile.existsSync()) {
      Logger.error("图片地址不存在", tag: _tag);
      return Future.error('图片地址不存在');
    }
    final fileName = path.split('/').last;

    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final recentlyUseImageDir =
        Directory("${appDocumentsDir.path}/$_imageDirName");
    if (!await recentlyUseImageDir.exists()) {
      await recentlyUseImageDir.create(recursive: true);
    }
    final recentImagePath = "${recentlyUseImageDir.path}/$fileName";
    if (File(recentImagePath).existsSync()) {
      Logger.error("图片地址已存在", tag: _tag);
      return recentImagePath;
    }
    tempFile.copySync(recentImagePath);
    return recentImagePath;
  }

  /// 删除指定图片并更新最近使用图片列表
  static void deleteRecentlyUseImage(
      List<String> remainPicPathList, String picPath) {
    try {
      // 更新本地存储的最近使用图片列表
      PreferencesManager.instance
          .setStringList(PreferencesKeys.recentlyUseImage, remainPicPathList);

      // 删除本地文件, 剩下图片地址不包含删除地址后在删除本地图片,（如果存在）
      if (remainPicPathList.contains(picPath)) {
        return;
      }
      _deleteLocalImageFile(picPath);
      Logger.info('删除最近使用图片成功: $picPath', tag: _tag);
    } catch (e) {
      Logger.error('删除最近使用图片失败：${e.toString()}', tag: _tag);
    }
  }

  /// 删除本地图片文件
  static Future<void> _deleteLocalImageFile(String relativePath) async {
    try {
      File picFile;

      if (Platform.isIOS) {
        final appDocumentsDir = await getApplicationDocumentsDirectory();
        final fullPath = '${appDocumentsDir.path}$relativePath';
        picFile = File(fullPath);
      } else {
        // Android直接使用绝对路径
        picFile = File(relativePath);
      }

      if (await picFile.exists()) {
        await picFile.delete();
        Logger.info('本地图片文件删除成功: $picFile', tag: _tag);
      }
    } catch (e) {
      Logger.error('删除本地图片文件失败：${e.toString()}', tag: _tag);
    }
  }
}
