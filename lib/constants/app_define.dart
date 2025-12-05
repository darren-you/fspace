/// App运行环境
const isProduct =
    String.fromEnvironment('environment', defaultValue: 'test') == "prod";

/// ToolBar
const kMyToolBarHeight = 56.0;

/// NavBar
const kMyNavBarHeight = 56.0;

/// 测试环境
String get kTestBaseURL => isProduct
    ? 'https://fridgerecoder.xdarren.com/app'
    : 'https://fridgerecoder.xdarren.com/app';

/// 正式环境
String get kBaseURL => isProduct
    ? 'https://fridgerecoder.xdarren.com/app'
    : 'https://fridgerecoder.xdarren.com/app';

/// 注销协议
const kCancelAccountURL =
    'https://fridgerecoder.xdarren.com/res/html/canceltheaccount';

/// 隐私政策
const kPrivacyURL = 'https://fridgerecoder.xdarren.com/res/html/privacy';

/// 用户协议
const kSupportURL = 'https://fridgerecoder.xdarren.com/res/html/support';

/// ICP备案地址
const kICPURL = 'https://beian.miit.gov.cn/';

/// 微信客服链接
const kWeXinServiceURL = 'https://work.weixin.qq.com/kfid/kfc2be507e1f4554192';

/// 链接白名单
const kURLSchemes = ['com.xdarren.fspace'];

/// 包信息
const kAndroidPackageName = 'com.xdarren.space';
const kIOSAppId = '6753889747';

/// 数数配置信息
const kThinkingAnalyticsAppID = 'c6068a0a8077438596c108e9cb179320';
const kThinkingAnalyticsServiceURL = "https://ss.51wnl.com";

/// AppsFlyers配置信息
const kAppsFlyerAppID = kIOSAppId;
const kAppsFlyerDevKey = 'aVg6HRucDUQU9zqCQ48TTZ';
