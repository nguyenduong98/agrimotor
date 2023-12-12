part of 'utils.dart';

extension LocaleExt on String {
  String get convertKorean => this == 'ko' ? 'kr' : this;
}

extension PhoneStringExt on String {
  String get standardizedPhone => replaceFirst('+84', '0');
}

extension NullableStringEx on String? {
  //
  String capitalize() {
    return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
  }

  String? get capitalizeWords {
    if (this == null) {
      return null;
    }

    if (this!.length <= 1) {
      return this!.toUpperCase();
    }

    final List<String> words = this!.toLowerCase().split(' ');

    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }
}

class RichTextFormatter {
  final Map<RegExp, TextStyle> patternMap;
  final TextStyle normalStyle;
  final bool isCaseSensitive;

  RichTextFormatter({
    required this.patternMap,
    required this.normalStyle,
    this.isCaseSensitive = true,
  });

  static TextSpan formatWithRecognizer(
    String text, {
    required Map<RegExp, TextSpanStyleWithRecognizer> styleMap,
    required TextStyle normalStyle,
    bool isCaseSensitive = true,
  }) {
    final children = <TextSpan>[];
    final allRegex = RegExp(
      styleMap.keys.map((e) => e.pattern).join('|'),
      caseSensitive: isCaseSensitive,
    );
    text.splitMapJoin(
      allRegex,
      onMatch: (match) {
        final m = match[0] ?? '';
        final key = styleMap.entries
            .singleWhere((e) =>
                RegExp(e.key.pattern, caseSensitive: isCaseSensitive)
                    .allMatches(m)
                    .isNotEmpty)
            .key;
        children.add(
          TextSpan(
            text: match[0],
            style: styleMap[key]?.textStyle,
            recognizer: styleMap[key]?.recognizer,
          ),
        );
        return m;
      },
      onNonMatch: (span) {
        children.add(TextSpan(text: span, style: normalStyle));
        return span;
      },
    );

    return TextSpan(style: normalStyle, children: children);
  }

  TextSpan buildFormattedTextSpan(String text) {
    return RichTextFormatter.formatWithRecognizer(
      text,
      styleMap: patternMap.map(
        (k, v) => MapEntry(
          k,
          TextSpanStyleWithRecognizer(v),
        ),
      ),
      normalStyle: normalStyle,
      isCaseSensitive: isCaseSensitive,
    );
  }
}

class TextSpanStyleWithRecognizer {
  final TextStyle textStyle;
  final GestureRecognizer? recognizer;

  TextSpanStyleWithRecognizer(this.textStyle, {this.recognizer});
}

enum FileType { video, image }

class StringUtils {
  StringUtils._();

  static String getInitials({required String string, int? limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    if (split.isEmpty) return '';
    for (var i = 0; i < (limitTo ?? split.length); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }

  static List<String> getImageLink(
    List<String>? videos,
    List<String>? images,
  ) {
    return (videos ?? [])..addAll(images ?? []);
  }

  static String getFileName(String filePath) {
    return path.basename(filePath);
  }

  static bool isYoutubeUrl(String url) {
    return RegExp(Patterns.youtubeUrl).hasMatch(url);
  }
}
