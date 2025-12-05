import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info_model.freezed.dart';
part 'app_info_model.g.dart';

/// App环境信息
@freezed
abstract class AppInfoModel with _$AppInfoModel {
  const factory AppInfoModel({
    @Default('') String packageName, // 包名
    @Default('') String appVersion, // App版本号
    @Default('') String deviceId, // 设备唯一标识
    @Default('') String deviceModel, // 设备平台: Android、iOS...
    @Default('') String systemVersion, // 系统版本
    @Default(false) bool firstLaunch, // 是否首次启动
  }) = _AppInfoModel;

  factory AppInfoModel.fromJson(Map<String, Object?> json) =>
      _$AppInfoModelFromJson(json);
}
