import '../../../../core/core.dart';
import 'main_screen.dart';

class MainRoutes {
  MainRoutes._();
  //Route name
  static const root = 'home';
  static const banner = 'banner';

  static String get rootPath => routes.firstWhere((r) => r.name == root).path;
  //
  static final routes = [
    GoRoute(
      path: '/home',
      name: root,
      pageBuilder: (context, state) => const MaterialPage(
        key: ValueKey('main'),
        name: root,
        child: MainScreen(initialPage: 2),
      ),
    )
  ];
}
