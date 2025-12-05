import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/src/main/kotlin/com/haijunwei/flutter_gysdk/Messages.g.kt',
  kotlinOptions: KotlinOptions(package: 'com.haijunwei.flutter_gysdk'),
  swiftOut: 'ios/Classes/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'flutter_umeng_share',
))
class LoginInfo {
  LoginInfo({
    required this.uid,
    required this.token,
    required this.expiredTime,
  });

  final String uid;
  final String token;
  final int expiredTime;
}

class PreLoginInfo {
  PreLoginInfo({
    required this.number,
    required this.privacyName,
    required this.privacyURL,
    required this.operatorType,
    required this.expiredTime,
  });

  final String number;
  final String privacyName;
  final String privacyURL;
  final String operatorType;
  final int expiredTime;
}

@HostApi()
abstract class GYSdkApi {
  void initSDK(String appId);

  @async
  PreLoginInfo preLogin(int timeout);

  bool isPreLoginResultValid();

  @async
  LoginInfo login(int timeout);
}
