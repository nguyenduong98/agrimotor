import '../../../../core/core.dart';
import 'splash_screen.dart';

class SplashRoutes {
  SplashRoutes._();

  static const splash = 'splash';

  static final routes = [
    GoRoute(
      path: '/splash',
      name: splash,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        name: splash,
        child: SplashScreen(
          from: decodeFrom(state.queryParams['from']),
        ),
      ),
    ),
  ];
}
