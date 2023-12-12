part of 'entities.dart';

class AppInfo extends Equatable {
  final String? bundleId;
  final Version? version;
  final Version? forceVersion;
  final String? storeUrl;
  final Map<String, dynamic>? notes;

  const AppInfo({
    this.bundleId,
    this.version,
    this.forceVersion,
    this.storeUrl,
    this.notes,
  });

  @override
  List<Object?> get props => [
        bundleId,
        version,
        forceVersion,
        storeUrl,
        notes,
      ];

  factory AppInfo.fromJson(Map<String, dynamic> map) {
    return AppInfo(
      bundleId: map['packageName'],
      version: Platform.isAndroid
          ? Version.parse(map['androidVersion'])
          : Version.parse(map['iosVersion']),
      forceVersion: Platform.isAndroid
          ? Version.parse(map['androidForceVersion'])
          : Version.parse(map['iosForceVersion']),
      storeUrl: Platform.isAndroid ? map['googlePlayUrl'] : map['appStoreUrl'],
      notes: map['notes'],
    );
  }

  static Future<AppInfo> load() {
    return PackageInfo.fromPlatform().then(
      (info) => AppInfo(
        bundleId: info.packageName,
        version: Version.parse('${info.version}+${info.buildNumber}'),
      ),
      onError: (_) => const AppInfo(),
    );
  }
}

class DeviceInfo extends Equatable {
  final String? id;
  final String? token;
  final String? deviceName;
  final String? brand;
  final String? osName;
  final String? osVersion;

  const DeviceInfo({
    this.id,
    this.token,
    this.deviceName,
    this.brand,
    this.osName,
    this.osVersion,
  });

  @override
  List<Object?> get props => [
        id,
        token,
        deviceName,
        brand,
        osName,
        osVersion,
      ];

  static Future<DeviceInfo> load() async {
    DeviceInfo deviceInfo = const DeviceInfo();
    try {
      final plugin = DeviceInfoPlugin();

      if (defaultTargetPlatform == TargetPlatform.iOS) {
        IosDeviceInfo info = await plugin.iosInfo;
        deviceInfo = DeviceInfo(
          id: info.identifierForVendor,
          deviceName: info.name,
          brand: info.model,
          osName: 'ios',
          osVersion: info.systemVersion,
        );
      }
      if (defaultTargetPlatform == TargetPlatform.android) {
        AndroidDeviceInfo info = await plugin.androidInfo;
        deviceInfo = DeviceInfo(
          id: info.id,
          deviceName: info.model,
          brand: info.brand,
          osName: 'android',
          osVersion: info.version.release,
        );
      }
    } catch (_) {
      deviceInfo = const DeviceInfo();
    }
    return deviceInfo;
  }
}
