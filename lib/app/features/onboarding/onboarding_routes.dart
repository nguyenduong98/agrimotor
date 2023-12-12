import '../../../core/core.dart';
import 'onboarding_screen.dart';

class OnBoardingRoutes {
  //
  static const selectLanguage = 'selectLanguage';
  static const onboarding = 'onboarding';
  static const storeSetup = 'storeSetup';
  //
  static final routes = [
    GoRoute(
      path: '/onboarding',
      name: onboarding,
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: OnboardingScreen(
          from: decodeFrom(state.queryParams['from']),
        ),
      ),
    ),
  ];
}
