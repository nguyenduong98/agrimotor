import '../core/core.dart';
import '../shared/shared.dart';
import 'app.dart';

extension AnalyticsTrackingExt on BuildContext {
  //
  // void logEvent(BaseTrackingEvent event) {
  //   GetIt.instance.get<AnalyticsTracking>().logEvent(event);
  // }
}

abstract class WidgetState<S extends StatefulWidget> extends BaseWidgetState<S>
    with RouteAware, TickerProviderStateMixin {
  //
  final appCubit = GetIt.instance.get<AppCubit>();
  // final noticeCenter = GetIt.instance.get<AppNoticeCenter>();
  final scrollController = ScrollController();

  //
  EventBus get bus => GetIt.instance.get<EventBus>();
  void fireEvent(dynamic event) => bus.fire(event);

  @override
  void didPopNext() {}

  void onStoreChanged() {}
  void onLanguageChanged() {}
}
