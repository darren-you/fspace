// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginInfoModel _$LoginInfoModelFromJson(Map<String, dynamic> json) =>
    _LoginInfoModel(
      userInfo: json['user_info'] == null
          ? const UserInfoModel()
          : UserInfoModel.fromJson(json['user_info'] as Map<String, dynamic>),
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$LoginInfoModelToJson(_LoginInfoModel instance) =>
    <String, dynamic>{
      'user_info': instance.userInfo,
      'token': instance.token,
    };
