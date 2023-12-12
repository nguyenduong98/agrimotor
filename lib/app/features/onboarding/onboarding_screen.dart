import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.from});

  final String? from;

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends WidgetState<OnboardingScreen> {
  //
  final cubit = GetIt.instance.get<AppCubit>();
  final pageController = PageController();
  final pageNotifier = ValueNotifier<int>(0);

  void onSkipOnboarding() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<AppCubit, AppState>(
          bloc: cubit,
          builder: (_, state) {
            //
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            //

            //
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: 62.h,
                  padding: EdgeInsets.only(right: 16.sp),
                  child: ValueListenableBuilder(
                    valueListenable: pageNotifier,
                    builder: (_, index, __) {
                      final isLastPage = index >= 3;
                      if (isLastPage) return const SizedBox();
                      return GestureDetector(
                        onTap: onSkipOnboarding,
                        behavior: HitTestBehavior.opaque,
                        child: Text(
                          'skip',
                          style: SharedTextTheme.regular16,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    itemCount: 3,
                    controller: pageController,
                    onPageChanged: (index) => pageNotifier.value = index,
                    itemBuilder: (_, index) => ValueListenableBuilder(
                      valueListenable: pageNotifier,
                      builder: (_, pageIndex, __) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        transitionBuilder: (child, anim) => ScaleTransition(
                          scale: anim,
                          child: child,
                        ),
                        child: pageIndex == index
                            ? Text('onBoarding')
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                SizedBox(height: 60.h),
                SizedBox(height: 32.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
