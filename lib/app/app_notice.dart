import '../core/core.dart';
import '../data/data.dart';

class AppNoticeCenter extends BaseCubit<AppNoticeState> {
  //
  AppNoticeCenter() : super(const AppNoticeState());
  //

  bool? isPopupConfirmed(PopupNotice popup) => state.statusMap[popup];

  Future<void> init() async {
    emit(state.copyWith());
  }

  Future<void> updateStatus(
    PopupNotice popup, {
    required bool confirmed,
  }) async {
    final map = state.statusMap;
    map[popup] = confirmed;
    emit(state.copyWith());
  }

  Future<void> clearStatus() async {
    final map = <PopupNotice, bool?>{};
    for (var popup in PopupNotice.values) {
      map[popup] = null;
    }

    emit(state.copyWith());
  }
}

class AppNoticeState extends BaseState {
  const AppNoticeState({
    super.error,
    super.isLoading,
    this.statusMap = const {},
  });

  final Map<PopupNotice, bool?> statusMap;

  @override
  AppNoticeState copyWith({
    bool? isLoading,
    dynamic error,
    Map<PopupNotice, bool?>? statusMap,
  }) {
    return AppNoticeState(
      error: error,
      isLoading: isLoading ?? this.isLoading,
      statusMap: statusMap ?? this.statusMap,
    );
  }

  @override
  List<Object?> get props => [
        error,
        isLoading,
        statusMap,
      ];
}

mixin AppNoticeMixin {
  void onNoticeGuard({
    required BuildContext context,
    PopupNotice? popup,
    VoidCallback? action,
    VoidCallback? onDecline,
  }) async {
    //
    if (popup == null) {
      action?.call();
      return;
    }
    //
    final noticeCenter = GetIt.instance.get<AppNoticeCenter>();
    final isConfirmed = noticeCenter.isPopupConfirmed(popup);
    //
    if (isConfirmed == null || !isConfirmed) {
      //
    } else if (isConfirmed) {
      action?.call();
    }
  }
}
