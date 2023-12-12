part of 'widgets.dart';

class IOSRefreshHeader extends RefreshIndicator {
  const IOSRefreshHeader({
    Key? key,
  }) : super(
          key: key,
          refreshStyle: RefreshStyle.Follow,
          completeDuration: const Duration(milliseconds: 600),
          height: 60,
        );

  @override
  State createState() => IOSRefreshHeaderState();
}

class IOSRefreshHeaderState extends RefreshIndicatorState<IOSRefreshHeader> {
  //
  Widget buildIcon(RefreshStatus? mode) {
    switch (mode) {
      case RefreshStatus.refreshing:
        return CupertinoActivityIndicator(radius: 12.sp);
      case RefreshStatus.canRefresh:
      case RefreshStatus.idle:
        return CupertinoActivityIndicator(
          animating: false,
          radius: 12.sp,
        );
      default:
        return const SizedBox();
    }
  }

  @override
  bool needReverseAll() => false;

  @override
  Widget buildContent(
    BuildContext context,
    RefreshStatus? mode,
  ) {
    Widget iconWidget = buildIcon(mode);
    return SizedBox(
      height: widget.height,
      child: Center(child: iconWidget),
    );
  }
}

class AppLoadMoreFooter extends LoadIndicator {
  const AppLoadMoreFooter({Key? key})
      : super(
          key: key,
          loadStyle: LoadStyle.ShowWhenLoading,
          height: 60.0,
        );

  @override
  State<StatefulWidget> createState() => AppLoadMoreFooterState();
}

class AppLoadMoreFooterState extends LoadIndicatorState<AppLoadMoreFooter> {
  Widget buildIcon(LoadStatus? mode) {
    final androidIndicator = SizedBox(
      height: 30.sp,
      width: 30.sp,
      child: CircularProgressIndicator(
        strokeWidth: 2.sp,
        color: Colors.red,
      ),
    );
    return switch (mode) {
      LoadStatus.loading => Platform.isIOS
          ? CupertinoActivityIndicator(radius: 12.sp)
          : androidIndicator,
      LoadStatus.canLoading || LoadStatus.idle => Platform.isIOS
          ? CupertinoActivityIndicator(radius: 12.sp, animating: false)
          : androidIndicator,
      _ => Container()
    };
  }

  @override
  Future endLoading() {
    return Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Widget buildContent(
    BuildContext context,
    LoadStatus? mode,
  ) {
    Widget iconWidget = buildIcon(mode);
    return SizedBox(
      height: widget.height,
      child: Center(child: iconWidget),
    );
  }
}
