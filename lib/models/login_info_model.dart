import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fspace/models/user_info_model.dart';

part 'login_info_model.freezed.dart';
part 'login_info_model.g.dart';

@freezed
abstract class LoginInfoModel with _$LoginInfoModel {
  const factory LoginInfoModel({
    @JsonKey(name: 'user_info')
    @Default(UserInfoModel())
    UserInfoModel userInfo,
    @JsonKey(name: 'token') @Default('') String token,
  }) = _LoginInfoModel;

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoModelFromJson(json);
}
