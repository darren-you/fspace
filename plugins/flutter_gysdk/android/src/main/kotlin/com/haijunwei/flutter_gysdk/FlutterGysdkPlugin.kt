package com.haijunwei.flutter_gysdk

import com.g.gysdk.GYManager
import com.g.gysdk.GYResponse
import com.g.gysdk.GyCallBack
import com.g.gysdk.GyConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import org.json.JSONObject

/** FlutterGysdkPlugin */
class FlutterGysdkPlugin: FlutterPlugin, GYSdkApi {
  var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = flutterPluginBinding
    GYSdkApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
  }

  override fun initSDK(appId: String) {
    if (flutterPluginBinding == null) return
    val context = flutterPluginBinding!!.applicationContext
    GYManager.getInstance().init(GyConfig.with(context).preLoginUseCache(true).callBack(object : GyCallBack {
      override fun onSuccess(p0: GYResponse?) {
      }

      override fun onFailed(p0: GYResponse?) {
      }
    }).build())
  }

  override fun preLogin(timeout: Long, callback: (Result<PreLoginInfo>) -> Unit) {
    GYManager.getInstance().ePreLogin(8 * 1000, object : GyCallBack {
      override fun onSuccess(response: GYResponse?) {
        val msg = response?.msg ?: ""
        if (msg.isEmpty()) {
          callback(Result.failure(Throwable(msg)))
        } else {
          val json = JSONObject(msg)
          val r = GYManager.getInstance().preLoginResult
          val info = PreLoginInfo(
              json["number"] as String,
              r.privacyName,
              r.privacyUrl,
              r.operator,
              json["expiredTime"] as Long
            )
          callback(Result.success(info))
        }
      }

      override fun onFailed(response: GYResponse?) {
        callback(Result.failure(Throwable(response?.msg)))
      }
    })
  }

  override fun login(timeout: Long, callback: (Result<LoginInfo>) -> Unit) {
    GYManager.getInstance().login((timeout * 1000).toInt(), null, object : GyCallBack {
      override fun onSuccess(response: GYResponse?) {
        val msg = response?.msg ?: ""
        if (msg.isEmpty()) {
          callback(Result.failure(Throwable(msg)))
        } else {
          val json = JSONObject(msg)
          val token = (json["data"] as JSONObject)["token"] as String
          val expiredTime = (json["data"] as JSONObject)["expiredTime"] as Long
          val info = LoginInfo(response?.gyuid ?: "", token, expiredTime)
          callback(Result.success(info))
        }
      }

      override fun onFailed(response: GYResponse?) {
        callback(Result.failure(Throwable(response?.msg)))
      }
    })
  }

  override fun isPreLoginResultValid(): Boolean {
    return GYManager.getInstance().isPreLoginResultValid
  }
}
