import '../core/core.dart';

class AppConfig {
  AppConfig._();

  static final _instance = AppConfig._();
  static AppConfig getInstance() => _instance;

  static const appName = 'LOTTE Mart';
  static const enableShowUpdateVersionPeriod = Duration(minutes: 20);
  static const String notificationChannelId = 'high_importance_channel';
  static const String notificationChannelName = 'High Importance Notifications';
  static const String defaultStoreCode = 'default';
  static const String cartType = 'mart';
  static const int maxRequestOtp = 3;
  static const privacyPolicyPage = 'privacy';
  static const memberPolicyPage = 'membership-policy';
  static const membershipBenefitsPage = 'membership-benefits';
  static const accountManagementPolicyPage = 'account-management';
  static const shippingDeliveryPage = 'shipping-delivery';

  Env _env = Env.dev;

  void init(Env env) => _env = env;

  static Env get env => getInstance()._env;

  static String get googleApiKey {
    switch (env) {
      case Env.dev:
      case Env.stg:
      case Env.prod:
        return 'AIzaSyAo9l0yiY-ckh0a_OCDO3osVZtvFBRBq1M';
    }
  }

  static String get webDomain {
    if (env == Env.dev) return 'dev.web.martonline.lotte.vn';
    if (env == Env.stg) return 'stg.web.lottemart.vn';
    return 'www.lottemart.vn';
  }

  static String staticPageUrl(
    String storeCode, {
    required String pageCode,
  }) {
    return 'https://$webDomain/$storeCode/$pageCode';
  }

  static String get paymentCallbackUrl {
    return 'martonline://$webDomain/checkout-complete';
  }

  static String get createTokenCallbackUrl {
    return 'martonline://$webDomain/my-page/my-payment-method';
  }

  static String get kakaoAppKey {
    return switch (env) {
      Env.dev => 'ecfea234e2cca1c0f14bbff46116a2d6',
      Env.stg => '41a067149856da8fdaf1bf59bb13e7f8',
      Env.prod => 'e2f2b07adcec5b60f439570c2122dbe6',
    };
  }

  static String get tiktokClientKey {
    switch (env) {
      case Env.dev:
      case Env.stg:
      case Env.prod:
        return 'awho2ty7zuu7nhpv';
    }
  }

  static String get tiktokSecrettKey {
    switch (env) {
      case Env.dev:
      case Env.stg:
      case Env.prod:
        return '25ac564572f6ed666bea7b309ec68796';
    }
  }

  static String get esBaseUrl {
    return switch (env) {
      Env.dev => 'https://dev.latg.lotte.vn/v1/p/dev-mart/es',
      Env.stg => 'https://stg.latg.lottemart.vn/v1/p/stg-mart/es',
      Env.prod => 'https://latg.lottemart.vn/v1/p/mart/es',
    };
  }

  static String get paymentBaseUrl {
    return switch (env) {
      Env.dev => 'https://dev.latg.lotte.vn/v1/p/dev-mart/payments',
      Env.stg => 'https://stg.latg.lottemart.vn/v1/p/stg-mart/payments',
      Env.prod => 'https://latg.lottemart.vn/v1/p/mart/payments',
    };
  }

  static String get bosBaseUrl {
    return switch (env) {
      Env.dev => 'https://dev.latg.lotte.vn/v1/p/dev-mart/bos',
      Env.stg => 'https://stg.latg.lottemart.vn/v1/p/stg-mart/bos',
      Env.prod => 'https://latg.lottemart.vn/v1/p/mart/bos',
    };
  }
}
