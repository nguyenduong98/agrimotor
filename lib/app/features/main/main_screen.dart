import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

final visibleBottomBar = ValueNotifier(true);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialPage});

  final int? initialPage;

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends WidgetState<MainScreen>
    with AutomaticKeepAliveClientMixin {
  //
  late PageController pageController;
  int pageIndex = 0;
  double previousIndex = 0;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initialPage ?? 0;
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialPage == null) return;
    pageIndex = widget.initialPage!;
    pageController.jumpToPage(pageIndex);
    setState(() {});
  }

  @override
  void afterFirstFrame(BuildContext context) {
    super.afterFirstFrame(context);
    // PushNotification.instance.handleInitialNotification();
  }

  void changePage(int index) {
    // if (index == pageIndex) return;
    // if (index == 0) context.goNamed(CategoryRoutes.root);
    // if (index == 1) context.goNamed(DeliveryTimeRoutes.root);
    // if (index == 2) context.goNamed(HomeRoutes.root);
    // if (index == 3) context.goNamed(MyPageRoutes.root);
    // if (index == 4) context.goNamed(QuickOrderRoutes.root);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollListenerWrapper(
      onForward: () => visibleBottomBar.value = true,
      onReverse: () => visibleBottomBar.value = false,
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                Container(child: Text('aaaa')),
                Container(child: Text('bbbb')),
                Container(child: Text('cccc')),
                Container(child: Text('dddd')),
                Container(child: Text('eeee')),
              ],
            ),
            // Positioned(
            //   bottom: 0.0,
            //   left: 0.0,
            //   right: 0.0,
            //   child: Container(),
            // )
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: visibleBottomBar,
          builder: (context, value, child) => AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: value ? const Offset(0, 0) : const Offset(0, 2),
            child: buildBottomBar(),
          ),
        ),
      ),
    );
  }

  Widget buildBottomBar() => CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        index: pageIndex,
        bottomPadding: MediaQuery.of(context).padding.bottom,
        buttonBackgroundColor: Colors.red,
        items: [
          //
          NavButtonItem(
            icon: SvgPicture.asset(SharedIcons.iconCategory),
            selectedIcon: Icon(Icons.abc),
            label: Text('Calender'),
          ),

          //
          NavButtonItem(
            icon: Icon(Icons.abc),
            selectedIcon: Icon(Icons.abc),
            label: Text('aaaa'),
          ),

          //
          NavButtonItem(
            icon: Icon(Icons.abc),
            selectedIcon: SizedBox(height: 24.sp),
            label: SizedBox(),
            selectedLabel: SizedBox(),
          ),

          //
          NavButtonItem(
            icon: Icon(Icons.abc),
            selectedIcon: Icon(Icons.abc),
            label: Text('bbbb'),
          ),

          //
          NavButtonItem(
            icon: Icon(Icons.abc),
            selectedIcon: Icon(Icons.abc),
            label: Text('cccc'),
          ),
        ],
        onTap: (index) {
          // previousIndex = pageController.page ?? 0;
          changePage(index);
        },
      );

  @override
  bool get wantKeepAlive => true;
}
