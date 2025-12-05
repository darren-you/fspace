import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pay_api_client.g.dart';

@RestApi()
abstract class PayApiClient {
  factory PayApiClient(Dio dio, {String? baseUrl}) = _PayApiClient;

  /// 公共支付接口
  // @POST('/api/payorder/GetNewSignStr')
  // Future<PayModel> createOrder({
  //   @Body() required Map<String, dynamic> params,
  // });

  @POST('/api/ApplePay/CommonNotify')
  Future<void> submitIAPPaymentResult({
    @Body() required Map<String, dynamic> params,
  });
}
