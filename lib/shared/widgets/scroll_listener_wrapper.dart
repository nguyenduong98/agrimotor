part of 'widgets.dart';

class ScrollListenerWrapper extends StatelessWidget {
  const ScrollListenerWrapper({
    super.key,
    required this.child,
    this.onForward,
    this.onReverse,
  });

  final VoidCallback? onReverse;
  final VoidCallback? onForward;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        final direction = notification.direction;
        final axis = notification.metrics.axis;
        if (axis == Axis.horizontal) return true;
        if (direction == ScrollDirection.reverse) {
          onReverse?.call();
        } else if (direction == ScrollDirection.forward) {
          onForward?.call();
        }
        return true;
      },
      child: child,
    );
  }
}
