class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    bool hasCustomDelimiter = false;
    bool isBracketFormat = false;

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      if (delimiterEnd != -1) {
        String delimiterPart = numbers.substring(2, delimiterEnd);

        if (delimiterPart.startsWith('[') && delimiterPart.endsWith(']')) {
          delimiter = delimiterPart.substring(1, delimiterPart.length - 1);
          isBracketFormat = true;
        } else {
          delimiter = delimiterPart;
        }

        numbers = numbers.substring(delimiterEnd + 1);
        hasCustomDelimiter = delimiter.isNotEmpty;
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
        splitPattern = RegExp('${RegExp.escape(delimiter)}');
      } else {
        splitPattern = RegExp('[$delimiter\n]');
      }
    } else {
      splitPattern = RegExp(r'[,\n]');
    }

    final numberString = numbers
        .split(splitPattern)
        .where((s) => s.isNotEmpty)
        .toList();

    int sum = 0;
    List<int> negatives = [];

    for (final numStr in numberString) {
      final num = int.parse(numStr);
      if (num < 0) {
        negatives.add(num);
      } else if (num <= 1000) {
        sum += num;
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(', ')}');
    }

    return sum;
  }
}
