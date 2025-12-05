// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    _UserInfoModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      avatar: json['avatar'] as String? ?? '',
      username: json['username'] as String? ?? '',
      diamond: (json['diamond'] as num?)?.toInt() ?? 0,
      phone: json['phone'] as String? ?? '',
      isVip: (json['is_vip'] as num?)?.toInt() ?? 0,
      vipInfo: json['vip_info'] == null
          ? const VipInfo()
          : VipInfo.fromJson(json['vip_info'] as Map<String, dynamic>),
      registAt: (json['regist_at'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserInfoModelToJson(_UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'username': instance.username,
      'diamond': instance.diamond,
      'phone': instance.phone,
      'is_vip': instance.isVip,
      'vip_info': instance.vipInfo,
      'regist_at': instance.registAt,
    };

_VipInfo _$VipInfoFromJson(Map<String, dynamic> json) => _VipInfo(
      vipType: (json['vip_type'] as num?)?.toInt() ?? 0,
      createAt: json['create_at'] as String? ?? '',
      renewalAt: json['renewal_at'] as String? ?? '',
      expireAt: json['expire_at'] as String? ?? '',
      isExpire: (json['is_expire'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VipInfoToJson(_VipInfo instance) => <String, dynamic>{
      'vip_type': instance.vipType,
      'create_at': instance.createAt,
      'renewal_at': instance.renewalAt,
      'expire_at': instance.expireAt,
      'is_expire': instance.isExpire,
    };
