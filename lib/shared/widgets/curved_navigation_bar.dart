part of 'widgets.dart';

typedef LetIndexPage = bool Function(int value);

class NavButtonItem {
  final Widget icon;
  final Widget selectedIcon;
  final Widget label;
  final Widget? selectedLabel;

  NavButtonItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.selectedLabel,
  });
}

class NavButton extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final NavButtonItem item;
  final bool showIcon;

  const NavButton({
    Key? key,
    required this.onTap,
    required this.item,
    this.isSelected = false,
    this.showIcon = true,
  }) : super(key: key);

  @override
  State<NavButton> createState() => NavButtonState();
}

class NavButtonState extends State<NavButton> with TickerProviderStateMixin {
  //
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animate();
  }

  void animate() {
    widget.isSelected ? controller.forward() : controller.reverse();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => widget.onTap(),
        child: SizedBox(
          height: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.5,
                      end: 1.0,
                    ).animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: Curves.easeInOutBack,
                      ),
                    ),
                    child: Center(
                      child: (widget.showIcon && widget.isSelected)
                          ? widget.item.selectedIcon
                          : SizedBox(height: 29.h),
                    ),
                  ),
                  Center(
                    child: (widget.showIcon && !widget.isSelected)
                        ? widget.item.icon
                        : SizedBox(height: 29.h),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              DefaultTextStyle(
                style: SharedTextTheme.regular12.copyWith(
                  color: widget.isSelected ? Colors.red : Colors.grey,
                  fontSize: 12.0.sp,
                  fontWeight:
                      widget.isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                child: widget.isSelected
                    ? widget.item.selectedLabel ?? widget.item.label
                    : widget.item.label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;
  final double bottomPadding;

  NavCustomPainter(
    double startingLoc,
    int itemsLength,
    this.color,
    this.textDirection, {
    this.bottomPadding = 0,
  }) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void paint(Canvas canvas, Size sz) {
    final size = Size(sz.width, sz.height - bottomPadding);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final delta = 0.05 * s;
    final middle = 0.5 * s;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 2 * delta) * size.width, 0)
      ..cubicTo(
        (loc + 2 * delta) * size.width,
        0,
        (loc + middle - 5 * delta) * size.width,
        size.height * 0.46,
        (loc + middle) * size.width,
        size.height * 0.46,
      )
      ..cubicTo(
        (loc + middle + 5 * delta) * size.width,
        size.height * 0.46,
        (loc + s - 2 * delta) * size.width,
        0,
        (loc + s + 2 * delta) * size.width,
        0,
      )
      ..lineTo(size.width + 2 * delta, 0)
      ..lineTo(size.width, size.height + bottomPadding)
      ..lineTo(0, size.height + bottomPadding)
      ..close();
    canvas.drawShadow(path, Colors.black, 60.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class CurvedNavigationBar extends StatefulWidget {
  final List<NavButtonItem> items;
  final int index;
  final Color color;
  final Color? buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int>? onTap;
  final LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final double bottomPadding;
  final int fixedIndex;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = 75.0,
    this.bottomPadding = 0,
    this.fixedIndex = 2,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items.isNotEmpty),
        assert(0 <= index && index < items.length),
        assert(0 <= height && height <= 75.0),
        super(key: key);

  @override
  State createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState<S extends CurvedNavigationBar> extends State<S>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  late int _endingIndex = widget.index;
  late double _pos;
  late AnimationController _animationController;
  late int _length;

  //
  int get length => widget.items.length;
  double get pos => widget.fixedIndex / length;

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {}
      });
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height + widget.bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: NavCustomPainter(
                widget.fixedIndex / length,
                length,
                widget.color,
                Directionality.of(context),
                bottomPadding: widget.bottomPadding,
              ),
              child: Container(height: widget.height + widget.bottomPadding),
            ),
          ),
          Positioned(
            bottom: -32 - (75.0 - widget.height) + widget.bottomPadding,
            left: pos * size.width,
            width: size.width / length,
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, -80),
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Material(
                    color: widget.fixedIndex == _endingIndex
                        ? Colors.red
                        : Colors.grey,
                    type: MaterialType.card,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    child: Container(
                      constraints: BoxConstraints.tightFor(
                        width: 49.sp,
                        height: 49.sp,
                      ),
                      child: Transform.rotate(
                        angle: -math.pi / 4,
                        child: widget.items[widget.fixedIndex].icon,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: widget.bottomPadding,
            child: SizedBox(
              child: Row(
                children: widget.items
                    .mapIndexed(
                      (index, item) => NavButton(
                        onTap: () => _buttonTap(index),
                        isSelected: index == _endingIndex,
                        showIcon: index != widget.fixedIndex,
                        item: item,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setPage(int index) => _buttonTap(index);

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
  }
}
