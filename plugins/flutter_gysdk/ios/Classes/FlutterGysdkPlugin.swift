import Flutter
import UIKit
import GeYanSdk

public class FlutterGysdkPlugin: NSObject, FlutterPlugin, GYSdkApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = FlutterGysdkPlugin()
        registrar.publish(instance)
        GYSdkApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    }
    
    func initSDK(appId: String) throws {
        GeYanSdk.start(withAppId: appId) { isSuccess, error, gtcid in
            
        }
    }
    
    func preLogin(timeout: Int64, completion: @escaping (Result<PreLoginInfo, any Error>) -> Void) {
        GeYanSdk.setPreLoginTimeout(TimeInterval(timeout))
        GeYanSdk.preGetToken { response in
            if let response {
                if response["code"] as? Int == 30000 {
                    var operatorType = ""
                    if let temp = response["operatorType"] as? Int {
                        operatorType = String(temp)
                    }
                    
                    completion(.success(PreLoginInfo(
                        number: response["number"] as? String ?? "",
                        privacyName: response["privacyName"] as? String ?? "",
                        privacyURL: response["privacyURL"] as? String ?? "",
                        operatorType: operatorType,
                        expiredTime: Int64(response["expiredTime"] as? Int ?? 0)
                    )))
                    return
                }
            }
            completion(.failure(NSError(domain: response?["msg"] as? String ?? "", code: 0)))
        }
    }
    
    func isPreLoginResultValid() throws -> Bool {
        return GeYanSdk.isPreGettedTokenValidate()
    }
    
    func login(timeout: Int64, completion: @escaping (Result<LoginInfo, any Error>) -> Void) {
        GeYanSdk.setEloginTimeout(TimeInterval(timeout))
        GyOneLoginPro.requestToken { response in
            if let response {
                if response["code"] as? Int == 30000 {
                    completion(.success(LoginInfo(
                        uid: response["gyuid"] as? String ?? "",
                        token: response["token"] as? String ?? "",
                        expiredTime: Int64(response["expiredTime"] as? Int ?? 0)
                    )))
                    return
                }
            }
            completion(.failure(NSError(domain: response?["msg"] as? String ?? "", code: 0)))
        }
    }
}
