import 'package:fspace/models/app_info_model.dart';
import 'package:dio/dio.dart';

class PayApiRequestInterceptor extends Interceptor {
  final AppInfoModel appInfo;

  PayApiRequestInterceptor({required this.appInfo});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> json = response.data;

    if (json["status"] == 200) {
      response.data = json["data"];
      handler.next(response);
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: json['msg'],
          response: response,
        ),
        true,
      );
    }
  }
}
