part of 'widgets.dart';

abstract class BaseWidgetState<S extends StatefulWidget> extends State<S> {
  void afterFirstFrame(BuildContext context) {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) afterFirstFrame(context);
      },
    );
  }

  void showErrorToast(String message) => showBottomToast(message, duration: 3);
  void showSuccessToast(String message) => showBottomToast(message);

  void showBottomToast(
    String message, {
    int? duration,
  }) {
    BotToast.showCustomText(
      toastBuilder: (cancelFunc) => Container(
        padding: EdgeInsets.all(16.sp),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          textAlign: TextAlign.center,
          message,
          style: SharedTextTheme.regular14.white,
        ),
      ),
      duration: Duration(seconds: duration ?? 1),
    );
  }

  Future<T?> navigator1Push<T>(
    Widget child, {
    String? routeName,
    Object? arg,
  }) =>
      context.navigator1Push<T>(
        child,
        routeName: routeName,
        arg: arg,
      );

  Future<T?> navigator1PushReplace<T, T0>(
    Widget child, {
    String? routeName,
    Object? arg,
    T0? result,
  }) =>
      context.navigator1PushReplace<T, T0>(
        child,
        routeName: routeName,
        arg: arg,
        result: result,
      );

  Future<T?> navgiator1PushRemoveUntil<T>(
    Widget child, {
    String? routeName,
    Object? arg,
    required bool Function(Route<dynamic>) test,
  }) =>
      context.navgiator1PushRemoveUntil<T>(
        child,
        routeName: routeName,
        arg: arg,
        test: test,
      );

  void navigator1Pop<T>([T? result]) => context.navigator1Pop<T>(result);
}

extension BuildContextExt on BuildContext {
  Future<T?> navigator1Push<T>(
    Widget child, {
    String? routeName,
    Object? arg,
  }) =>
      Navigator.of(this).push<T>(
        MaterialPageRoute(
          builder: (_) => child,
          settings: RouteSettings(name: routeName, arguments: arg),
        ),
      );

  Future<T?> navigator1PushReplace<T, T0>(
    Widget child, {
    String? routeName,
    Object? arg,
    T0? result,
  }) =>
      Navigator.of(this).pushReplacement<T, T0>(
        MaterialPageRoute(
          builder: (_) => child,
          settings: RouteSettings(name: routeName, arguments: arg),
        ),
        result: result,
      );

  Future<T?> navgiator1PushRemoveUntil<T>(
    Widget child, {
    String? routeName,
    Object? arg,
    required bool Function(Route<dynamic>) test,
  }) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
        MaterialPageRoute(
          builder: (_) => child,
          settings: RouteSettings(name: routeName, arguments: arg),
        ),
        test,
      );

  void navigator1Pop<T>([T? result]) => Navigator.of(this).pop(result);
}
