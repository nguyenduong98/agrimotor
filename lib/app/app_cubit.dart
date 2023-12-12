import '../core/core.dart';
import '../data/data.dart';
import 'app_config.dart';

class AppCubit extends BaseCubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> onInit() async {
    try {
      if (state.isInitialized) return;
      emit(const AppState(isLoading: true));

      final appInfo = await AppInfo.load();
      final deviceInfo = await DeviceInfo.load();

      final connected = await NetworkUtil.instance.hasInternet();

      AppInfo? appStoreInfo;

      emit(
        state.copyWith(
          isLoading: false,
          appInfo: appInfo,
          appStoreInfo: appStoreInfo,
          deviceInfo: deviceInfo,
          hasInternet: connected,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void onDisableShowUpdateVersion() async {
    emit(state.copyWith(enableUpdate: false));
    Timer(
      AppConfig.enableShowUpdateVersionPeriod,
      () => emit(state.copyWith(enableUpdate: true)),
    );
  }
}

class AppState extends BaseState {
  const AppState({
    super.isLoading,
    super.error,
    this.isFirstLaunch = false,
    this.hasInternet = true,
    this.enableUpdate = true,
    this.appInfo,
    this.appStoreInfo,
    this.deviceInfo,
  });

  final AppInfo? appInfo;
  final AppInfo? appStoreInfo;
  final DeviceInfo? deviceInfo;
  final bool isFirstLaunch;
  final bool hasInternet;
  final bool enableUpdate;

  bool get isInitialized =>
      appInfo != null && appStoreInfo != null && deviceInfo != null;

  bool get hasNewVersion {
    if (appInfo == null || appStoreInfo == null) return false;
    final currentVersion = appInfo!.version;
    final storeVersion = appStoreInfo!.version;
    if (currentVersion == null || storeVersion == null) return false;
    return storeVersion > currentVersion;
  }

  bool get hasForceUpdate {
    final forceVersion = appStoreInfo?.forceVersion;
    final currentVersion = appInfo?.version;
    if (forceVersion == null || currentVersion == null) return false;
    return hasNewVersion && currentVersion <= forceVersion;
  }

  bool get needShowUpdate => hasForceUpdate || (hasNewVersion && enableUpdate);

  bool get isInitialState => this == const AppState();

  @override
  AppState copyWith({
    bool? isLoading,
    dynamic error,
    AppInfo? appInfo,
    AppInfo? appStoreInfo,
    DeviceInfo? deviceInfo,
    bool? isFirstLaunch,
    bool? enableUpdate,
    bool? hasInternet,
  }) =>
      AppState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        appInfo: appInfo ?? this.appInfo,
        appStoreInfo: appStoreInfo ?? this.appStoreInfo,
        deviceInfo: deviceInfo ?? this.deviceInfo,
        isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
        enableUpdate: enableUpdate ?? this.enableUpdate,
        hasInternet: hasInternet ?? this.hasInternet,
      );

  @override
  List<Object?> get props => [
        isLoading,
        appInfo,
        appStoreInfo,
        deviceInfo,
        error,
        isFirstLaunch,
        enableUpdate,
        hasInternet,
      ];
}
