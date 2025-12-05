import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

/// 用户信息
@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'avatar') @Default('') String avatar,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'diamond') @Default(0) int diamond,
    @JsonKey(name: 'phone') @Default('') String phone,

    ///1-vip 0-普通会员
    @JsonKey(name: 'is_vip') @Default(0) int isVip,
    @JsonKey(name: 'vip_info') @Default(VipInfo()) VipInfo vipInfo,
    @JsonKey(name: 'regist_at') @Default(0) int registAt,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, Object?> json) =>
      _$UserInfoModelFromJson(json);
}

@freezed
abstract class VipInfo with _$VipInfo {
  const factory VipInfo({
    @JsonKey(name: 'vip_type') @Default(0) int vipType,
    @JsonKey(name: 'create_at') @Default('') String createAt,
    @JsonKey(name: 'renewal_at') @Default('') String renewalAt,
    @JsonKey(name: 'expire_at') @Default('') String expireAt,
    @JsonKey(name: 'is_expire') @Default(0) int isExpire,
  }) = _VipInfo;

  factory VipInfo.fromJson(Map<String, Object?> json) =>
      _$VipInfoFromJson(json);
}
