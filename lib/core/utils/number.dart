part of 'utils.dart';

abstract class NumberFormatter {
  String formatPercent(double value);

  String formatCurrency(double value, {String locale = 'vi'});

  String formatDate(DateTime date, {String locale = 'vi'});
}

class SimpleFormatter extends NumberFormatter {
  @override
  String formatCurrency(double value, {String locale = 'vi'}) {
    return NumberFormat('###,###,###,###.##₫', locale).format(value);
  }

  @override
  String formatPercent(double value) => NumberFormat('###%').format(value);

  @override
  String formatDate(
    DateTime date, {
    String locale = 'vi',
    bool withHHmm = false,
  }) =>
      DateFormat('${withHHmm ? 'HH:mm ' : ''}dd/MM/yyyy', locale).format(
        date.toLocal(),
      );

  String formatInt(num value, {String locale = 'vi'}) =>
      NumberFormat.decimalPattern(locale).format(value);

  String formatIntWithK(int value, {String locale = 'en'}) {
    if (value < 1000) {
      return NumberFormat('###,###,###,###.#', locale).format(value);
    } else {
      int needRemove = value % 100;
      int valueRound = value - needRemove;
      return '${NumberFormat('###,###,###,###.#', locale).format((valueRound.toDouble() / 1000.0))}K';
    }
  }

  String formatPoint(double? value, {String locale = 'vi'}) {
    return NumberFormat('###,###,###,###', locale).format(value ?? 0);
  }

  String formatMemberCard(String? value) {
    final number = DynamicParser.parseInt(value);
    return NumberFormat(
      '####,####,####,####',
      'vi',
    ).format(number ?? 0);
  }

  String formatRating(double? rating) {
    if (rating == null) return '5';
    return ((rating * 10).round() / 10).toStringAsFixed(1);
  }

  double formatStars(double? rating) {
    if (rating == null) return 5.0;
    final originalRating = rating.toInt();
    return originalRating.toDouble() == rating
        ? rating
        : (originalRating + 0.5).toDouble();
  }
}
