part of 'utils.dart';

class DynamicParser {
  DynamicParser._();

  static int? parseInt(dynamic value) {
    if (value is String) return num.tryParse(value)?.toInt();
    if (value is num) return value.toInt();
    return null;
  }

  static double? parseDouble(dynamic value) {
    if (value is String) return num.tryParse(value)?.toDouble();
    if (value is num) return value.toDouble();
    return null;
  }

  static DateTime? tryParseUtc(String? input) {
    if (input?.isEmpty ?? true) return null;
    return DateTime.tryParse('${input}Z')?.toLocal();
  }

  static DateTime? parseDate(dynamic value) {
    if (value == null) return null;
    int? intValue;
    if (value is num) {
      intValue = value.toInt();
      if (intValue < math.pow(10, 12)) {
        intValue *= 1000;
      }
    }
    if (value is String) intValue = int.tryParse(value);
    if (intValue == null) return null;
    if (intValue == 0) return null;
    return DateTime.fromMillisecondsSinceEpoch(intValue, isUtc: true);
  }

  static DateTime? parseDateFromTimeStamp(dynamic value) {
    if (value == null) return null;
    int? intValue;
    if (value is num) {
      intValue = value.toInt();
    } else if (value is String) {
      intValue = int.tryParse(value);
    }
    if (intValue == null) return null;
    if (intValue == 0) return null;
    return DateTime.fromMicrosecondsSinceEpoch(intValue * 1000000);
  }
}
