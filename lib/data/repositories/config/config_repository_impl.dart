part of 'config_repository.dart';

class ConfigRepositoryImpl extends BaseRepository implements ConfigRepository {
  ConfigRepositoryImpl(
    this.localStorage,
    this.bosApi,
  );

  static const _firstInstallFlag = 'firstInstallFlag';

  final LocalStorage localStorage;
  final BosApi bosApi;
  late SharedPreferences _sharedPreferences;

  final connectionChangeListeners = <ValueChanged<bool>>[];
  final configChangeListeners = <VoidCallback>[];

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    NetworkUtil.instance.onConnectivityChanged((connected) {
      for (var callback in connectionChangeListeners) {
        callback.call(connected);
      }
    });
  }

  @override
  Future<bool> isFirstLaunch() async {
    try {
      final firstFlag = _sharedPreferences.getString(_firstInstallFlag);
      if (firstFlag == null || firstFlag.isEmpty) {
        await localStorage.clear();
        await _sharedPreferences.setString(
          _firstInstallFlag,
          DateTime.now().toIso8601String(),
        );
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
