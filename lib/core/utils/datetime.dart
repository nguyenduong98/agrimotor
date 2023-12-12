part of 'utils.dart';

class DateTimeUtil {
  static DateTime? tryParse(String value) {
    try {
      return DateFormat('yyyy-MM-dd').parse(value);
    } catch (_) {
      return null;
    }
  }
}

extension DateTimeExt on DateTime {}
