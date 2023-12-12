part of 'utils.dart';

class TrimInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.isEmpty && newValue.text == ' ') {
      return const TextEditingValue();
    }
    var newText = newValue.text; //.trim();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class AmountInputFormatter extends TextInputFormatter {
  AmountInputFormatter({
    this.formatAmount,
    this.locale = 'vi',
    this.maxAmount,
  });

  final String Function(double)? formatAmount;
  final String locale;
  final double? maxAmount;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.isEmpty && newValue.text == '0') {
      return newValue.copyWith(text: '');
    }
    if (newValue.selection.baseOffset == 0) return newValue;
    var value = double.tryParse(newValue.text);
    String newText = value != null
        ? (formatAmount != null
            ? formatAmount!.call(valueOrMax(value))
            : NumberFormat('###,###,###,###.##', locale).format(
                valueOrMax(value),
              ))
        : '';
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  double valueOrMax(double value) {
    return maxAmount == null
        ? value
        : value > maxAmount!
            ? maxAmount!
            : value;
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class PointsInputFormatter extends TextInputFormatter {
  PointsInputFormatter({this.locale = 'vi'});

  final String locale;

  static String format(int points, {String locale = 'vi'}) {
    return NumberFormat.decimalPattern(locale).format(points);
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if ((oldValue.text.isEmpty && newValue.text == '0') ||
        (oldValue.text.isNotEmpty && newValue.text.isEmpty)) {
      return newValue.copyWith(
        text: '0',
        selection: const TextSelection.collapsed(offset: 1),
      );
    }
    if (newValue.selection.baseOffset == 0) return newValue;
    var value = double.tryParse(newValue.text);
    final newText = NumberFormat.decimalPattern(locale).format(value ?? '0');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
