class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    List<String> delimiters = [','];
    bool hasCustomDelimiter = false;
    bool isBracketFormat = false;
    String singleDelimiter = '';

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      if (delimiterEnd != -1) {
        String delimiterPart = numbers.substring(2, delimiterEnd);

        if (delimiterPart.startsWith('[')) {
          delimiters = _parseBracketDelimiters(delimiterPart);
          isBracketFormat = true;
        } else {
          singleDelimiter = delimiterPart;
          delimiters = [delimiterPart];
        }

        numbers = numbers.substring(delimiterEnd + 1);
        hasCustomDelimiter =
            delimiters.isNotEmpty && delimiters.any((d) => d.isNotEmpty);
      } else {
        print(
          'The String should start with // and have a \\n after the delimiter',
        );
        return 0;
      }
    }

    final RegExp splitPattern;
    if (hasCustomDelimiter) {
      if (isBracketFormat) {
        String pattern = delimiters.map((d) => RegExp.escape(d)).join('|');
        print('DEBUG: Pattern: $pattern');
        splitPattern = RegExp('$pattern');
      } else {
        String allChars = delimiters.join('');
        splitPattern = RegExp('[$allChars\n]');
      }
    } else {
      splitPattern = RegExp(r'[,\n]');
    }

    final numberString = numbers
        .split(splitPattern)
        .where((s) => s.isNotEmpty)
        .where((s) {
          if (singleDelimiter == 'o') {
            if (int.parse(s) % 2 != 0) {
              return true;
            } else {
              return false;
            }
          }
          return true;
        })
        .toList();
    print(numberString);

    int result = singleDelimiter == '*' ? 1 : 0;

    List<int> negatives = [];

    for (final numStr in numberString) {
      final num = int.parse(numStr);
      if (num < 0) {
        negatives.add(num);
      } else if (num <= 1000) {
        if (singleDelimiter == '*') {
          result *= num;
        } else {
          result += num;
        }
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(', ')}');
    }

    return result;
  }

  List<String> _parseBracketDelimiters(String delimiterPart) {
    List<String> delimiters = [];
    int start = 0;

    while (start < delimiterPart.length) {
      if (delimiterPart[start] == '[') {
        int end = delimiterPart.indexOf(']', start);
        if (end != -1) {
          String delimiter = delimiterPart.substring(start + 1, end);
          start = end + 1;
          if (delimiter.isEmpty) {
            continue;
          }
          delimiters.add(delimiter);
        } else {
          print('DEBUG: No closing bracket found');
          return [];
        }
      }
    }

    return delimiters;
  }
}
