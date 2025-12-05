import 'package:dio/dio.dart';
import 'package:fspace/base/response/base_response.dart';
import 'package:fspace/models/app_config_model.dart';
import 'package:fspace/models/banner_model.dart';
import 'package:fspace/models/login_info_model.dart';
import 'package:fspace/models/template_category_model.dart';
import 'package:fspace/models/template_model.dart';
import 'package:fspace/models/user_info_model.dart';
import 'package:fspace/models/app_version_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  /// 发送验证码
  @POST('/api/user/login/send_code')
  Future<BaseResponse<String>> getSMSCode({
    @Field() required String phone,
    @Field() required int timestamp,
  });

  /// 验证码登录
  @POST('/api/user/login/code')
  Future<BaseResponse<LoginInfoModel>> loginBySmsCode({
    @Field() required String phone,
    @Field() required String code,
  });

  /// 苹果登录
  @POST('/api/user/login/apple')
  Future<BaseResponse<LoginInfoModel>> loginByApple({
    @Field('identity_token') required String identityToken,
    @Field('authorization_code') required String authorizationCode,
  });

  /// Google登录
  @POST('/api/user/login/google')
  Future<BaseResponse<LoginInfoModel>> loginByGoogle({
    @Field('id_token') required String idToken,
  });

  /// 获取用户信息
  @GET('/api/user/info')
  Future<BaseResponse<UserInfoModel>> getCurrentUserInfo();

  /// 注销
  @POST('/api/user/info/cancel')
  Future<BaseResponse<String?>> deleteAccount();

  /// 退出登录
  @POST('/api/user/info/logout')
  Future<BaseResponse<String?>> logout();

  /// 获取app版本，检查有没有更新
  @GET('/api/common/version')
  Future<BaseResponse<AppVersionModel>> getAppVersion();

  /// 获取app配置

  @GET('/api/config')
  Future<BaseResponse<AppConfigModel>> getAppConfig();

  ///苹果支付校验
  @POST('/api/pay/apple_verify')
  Future<void> submitIAPAppleVerify({
    @Body() required Map<String, dynamic> params,
  });

  ///Google支付校验
  @POST('/api/pay/android_verify')
  Future<void> submitIAPAndroidVerify({
    @Body() required Map<String, dynamic> params,
  });

  /// 获取主分类下模板分类列表
  @GET('/api/template/category/list')
  Future<BaseResponse<List<TemplateCategoryModel>>> getTemplateCategoryList();

  /// 获取banner
  ///
  /// photo_middle、sing_middle、dance_middle...
  @GET('/api/banner/{location}')
  Future<BaseResponse<List<BannerModel>>> locationBannerDetial({
    @Path() required String location,
  });

  /// 获取分类下模板列表
  ///
  /// 主分类id: 1-写真
  @GET('/api/template/list/{id}')
  Future<BaseResponse<List<TemplateModel>>> getPhotoCategroyTemplateDetail({
    @Path('id') required int id, // 模板分类id
    @Query('page') required int page,
    @Query('size') required int size,
  });
}
