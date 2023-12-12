import '../core/core.dart';
import 'app.dart';

import 'features/main/main_routes.dart';
import 'features/main/main_screen.dart';
import 'features/onboarding/onboarding_routes.dart';
import 'features/splash/splash_routes.dart';

class InitRedirector {
  InitRedirector({required this.initPath});

  final String initPath;

  String? call(BuildContext context, GoRouterState state) {
    final appCubit = GetIt.instance.get<AppCubit>();

    final isInitialized = appCubit.state.isInitialized;
    final isInitializing = state.subloc == initPath;

    if (!isInitialized && !isInitializing) {
      return '$initPath?from=${encodeFrom(state.location)}';
    }
    if (isInitialized && isInitializing) {
      return MainRoutes.root;
    }

    return null;
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  //
  static const root = 'root';
  static const splash = 'splash';
  static const notFound = 'notFound';
  //
  static final routes = GoRouter(
    initialLocation: AppDeeplinkHandler.instance.initalRoute,
    redirect: InitRedirector(initPath: '/splash'),
    observers: [routeObserver],
    navigatorKey: navigatorKey,
    errorPageBuilder: (_, state) => MaterialPage(
      key: state.pageKey,
      name: notFound,
      child: Scaffold(
        body: Text('Error'),
      ),
    ),
    routes: [
      GoRoute(
        path: '/',
        name: root,
        pageBuilder: (context, state) => const MaterialPage(
          key: ValueKey('main'),
          child: MainScreen(initialPage: 2),
          name: root,
        ),
        routes: [
          // ...AuthRoutes.routes,
          // ...CartRoutes.routes,
          // ...NotificationRoutes.routes,
          // ...ProductRoutes.routes,
          // ...SearchRoutes.routes,
          // ...CheckoutRoutes.routes,
          // ...LandingRoutesV2.routes,
          // ...StaticPageRoutes.routes,
        ],
      ),
      ...SplashRoutes.routes,
      // ...CategoryRoutes.routes,
      ...OnBoardingRoutes.routes,
      // ...DeliveryTimeRoutes.routes,
      ...MainRoutes.routes,
      // ...MyPageRoutes.routes,
      // ...QuickOrderRoutes.routes,
      GoRoute(
        path: '/:pageCode',
        redirect: (_, state) => '/pages/${state.params['pageCode']}',
      ),
    ],
  );
}
