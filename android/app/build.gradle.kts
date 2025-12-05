plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.xdarren.fspace"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.xdarren.fspace"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
        manifestPlaceholders += mapOf(
            // "qqappid" to "102626602",
            // 个推信息
            "GETUI_APPID" to "5LlhX00A6S67mWBIvx2MG7",
            "GT_INSTALL_CHANNEL" to ""

            // 个推消息多厂商
            // "HUAWEI_APP_ID" to "114995195", // 华为 相关应用参数
            // "XIAOMI_APP_ID" to "2882303761520446277", // 小米相关应用参数
            // "XIAOMI_APP_KEY" to "5712044684277",
            // "OPPO_APP_KEY" to "0125782919c6427c8b592ebaced0f3e9", // OPPO 相关应用参数   
            // "OPPO_APP_SECRET" to "2ec627aff4db45b78a64d90e00e4ca41",
            // "VIVO_APP_ID" to "105952852", // VIVO 相关应用参数   
            // "VIVO_APP_KEY" to "3c8bda5a4d648a1029d9ca6b61548e92",
            // "HONOR_APP_ID" to "104516948" // 荣耀相关应用参数
        )
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
