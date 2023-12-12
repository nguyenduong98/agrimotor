import 'app/app.dart';
import 'core/core.dart';

void main() {
  runZonedGuarded(() async {
    await initializeComponents(Env.dev);
    //
    //
    runApp(const LotteMartApp());
  }, (error, stack) {
    // FirebaseCrashlytics.instance.recordError(
    //   error,
    //   stack,
    //   fatal: true,
    // );
  });
}

Future<void> initializeComponents(Env env) async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.getInstance().init(env);

  //
  // await Firebase.initializeApp();

  await Future.wait([
    // PushNotification.instance.init(),
    AppDeeplinkHandler.instance.init(),
    // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode),
  ]);

  await MapUtil.requestLocationPermission();

  //
  //
  final storage = SecuredStorage();
  // final tokenStorage = SecureTokenStorage<JwtToken>(
  //   tokenKey: 'token_key',
  //   create: () => JwtToken(),
  //   storage: storage,
  // );

  // final interceptor = RefreshTokenInterceptor<JwtToken>(
  //   tokenStorage: tokenStorage,
  //   headerBuilder: (token) {
  //     final headers = <String, String>{};
  //     if (token.customerToken != null) {
  //       headers['Authorization'] = 'Bearer ${token.customerToken}';
  //     }
  //     return headers;
  //   },
  //   refreshToken: (token, dio) => throw RevokeTokenException(),
  // );

  // final bosApi = BosApi(
  //   Dio()
  //     ..options.baseUrl = AppConfig.bosBaseUrl
  //     ..options.connectTimeout = 30000
  //     ..options.receiveTimeout = 120000
  //     ..options.sendTimeout = 30000
  //     ..interceptors.addAll([
  //       interceptor,
  //       if (env != Env.prod)
  //         PrettyDioLogger(
  //           requestBody: true,
  //           requestHeader: true,
  //         ),
  //     ]),
  // );

  GetIt.instance.registerLazySingleton<LocalStorage>(() => storage);

  /**
   * Cubit
   */
  GetIt.instance.registerLazySingleton(
    () => AppCubit(),
  );
}
