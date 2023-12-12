import '../core/core.dart';
import '../shared/shared.dart';
import 'app.dart';

// export 'app_push.dart'
export 'app_cubit.dart';
export 'app_routes.dart';
export 'app_config.dart';
export 'app_const.dart';
export 'app_deeplink.dart';
export 'app_widget_state.dart';
export 'app_notice.dart';

final routeObserver = RouteObserver<ModalRoute>();

class LotteMartApp extends StatefulWidget {
  const LotteMartApp({super.key});

  @override
  State<LotteMartApp> createState() => LotteMartAppState();
}

class LotteMartAppState extends WidgetState<LotteMartApp>
    with WidgetsBindingObserver {
  LotteMartAppState() {
    WidgetsBinding.instance.addObserver(this);
  }

  final botToastBuilder = BotToastInit();

  @override
  void dispose() {
    AppDeeplinkHandler.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    Widget appOverlay(AppState state, Widget child) {
      return ShowCaseWidget(
        builder: Builder(
          builder: (_) => AnimatedOverlay(
            showIf: state.needShowUpdate,
            alignment: Alignment.bottomCenter,
            overlay: const SizedBox(),
            //
            child: child,
          ),
        ),
      );
    }

    //
    Widget refreshConfig({required Widget child}) {
      final isIos = Platform.isIOS;
      return RefreshConfiguration(
        headerBuilder: isIos ? () => const IOSRefreshHeader() : null,
        footerBuilder: () => const AppLoadMoreFooter(),
        headerTriggerDistance: 80.0,
        springDescription: const SpringDescription(
          stiffness: 170,
          damping: 16,
          mass: 1.9,
        ),
        child: child,
      );
    }

    return MultiProvider(
      providers: [BlocProvider.value(value: appCubit)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => child!,
        child: BlocConsumer<AppCubit, AppState>(
          listener: (_, state) {},
          builder: (_, state) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: refreshConfig(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: appOverlay(state, botToastBuilder(context, child)),
                ),
                routerConfig: AppRoutes.routes,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
