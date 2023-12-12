part of 'utils.dart';

class MapUtil {
  MapUtil._();

  static void openGoogleMaps({
    required double lat,
    required double long,
  }) {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    launchUrlString(url).catchError((_) => false);
  }

  static Future<void> requestLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      switch (permission) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
        case LocationPermission.deniedForever:
          return;
        default:
          await Geolocator.requestPermission();
          return;
      }
    } catch (_) {}
  }
}
