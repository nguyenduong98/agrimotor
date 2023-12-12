import '../../../core/core.dart';
import '../../app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.from});

  final String? from;

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends WidgetState<SplashScreen> {
  //
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  void afterFirstFrame(context) => Future.wait([appCubit.onInit()]);

  void handleAppState(BuildContext context, AppState state) async {
    if (state.isInitialState || state.isLoading) return;
    if (state.error != null) {
      showErrorToast('Có lỗi xảy ra');
      return;
    }
    if (state.needShowUpdate) return;
    if (!state.isInitialized) return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: handleAppState,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FadeTransition(
          opacity: animation,
          child: const Stack(
            children: [Text('Splash screen')],
          ),
        ),
      ),
    );
  }
}
