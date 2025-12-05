// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppInfoModel _$AppInfoModelFromJson(Map<String, dynamic> json) =>
    _AppInfoModel(
      packageName: json['packageName'] as String? ?? '',
      appVersion: json['appVersion'] as String? ?? '',
      deviceId: json['deviceId'] as String? ?? '',
      deviceModel: json['deviceModel'] as String? ?? '',
      systemVersion: json['systemVersion'] as String? ?? '',
      firstLaunch: json['firstLaunch'] as bool? ?? false,
    );

Map<String, dynamic> _$AppInfoModelToJson(_AppInfoModel instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'appVersion': instance.appVersion,
      'deviceId': instance.deviceId,
      'deviceModel': instance.deviceModel,
      'systemVersion': instance.systemVersion,
      'firstLaunch': instance.firstLaunch,
    };
