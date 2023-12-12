part of 'widgets.dart';

class AnimatedOverlay extends StatefulWidget {
  const AnimatedOverlay({
    super.key,
    required this.child,
    required this.overlay,
    this.alignment = Alignment.topCenter,
    this.showIf = false,
  });

  final Widget child;
  final Widget overlay;
  final Alignment alignment;
  final bool showIf;

  @override
  State<AnimatedOverlay> createState() => AnimatedOverlayState();
}

class AnimatedOverlayState extends BaseWidgetState<AnimatedOverlay>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController animController;
  late final Animation<double> fadeAnim;
  late final Animation<Offset> slideFromBottomAnim;
  late final Animation<Offset> slideFromTopAnim;
  late final showOverlay = ValueNotifier(false);
  //

  @override
  void initState() {
    super.initState();
    const animDuration = Duration(milliseconds: 400);
    const revDuration = Duration(milliseconds: 200);

    animController = AnimationController(
      vsync: this,
      duration: animDuration,
      reverseDuration: revDuration,
    );
    final curveAnim = CurvedAnimation(
      parent: animController,
      curve: Curves.easeOutCirc,
      reverseCurve: Curves.easeInOut,
    );
    fadeAnim = Tween(begin: 0.0, end: 1.0).animate(animController);

    slideFromBottomAnim = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(curveAnim);

    slideFromTopAnim = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(curveAnim);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showIf != widget.showIf) onAnimate();
  }

  @override
  void afterFirstFrame(context) {
    if (widget.showIf) onAnimate();
  }

  void onAnimate() {
    if (widget.showIf) {
      showOverlay.value = true;
      animController.forward();
    } else {
      animController
          .reverse()
          .whenComplete(() => showOverlay.value = false)
          .catchError((_) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ValueListenableBuilder(
        valueListenable: showOverlay,
        builder: (_, __, ___) => Stack(
          children: [
            Positioned.fill(child: widget.child),
            if (showOverlay.value)
              FadeTransition(
                opacity: fadeAnim,
                child: Container(
                  color: Colors.black26,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            if (showOverlay.value)
              SafeArea(
                child: Align(
                  alignment: widget.alignment,
                  child: FadeTransition(
                    opacity: fadeAnim,
                    child: SlideTransition(
                      position: widget.alignment == Alignment.topCenter
                          ? slideFromTopAnim
                          : slideFromBottomAnim,
                      child: widget.overlay,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
