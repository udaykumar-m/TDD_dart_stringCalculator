class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiter = ',';
    bool hasCustomDelimiter = false;

    if (numbers.startsWith('//')) {
      final delimiterEnd = numbers.indexOf('\n');
      if (delimiterEnd != -1) {
        delimiter = numbers.substring(2, delimiterEnd);
        numbers = numbers.substring(delimiterEnd + 1);
        hasCustomDelimiter = delimiter.isNotEmpty;
      } else {
        print(
          'The String should start with // and have a \\n after the delimiter',
        );
        return 0;
      }
    }

    final numberString = numbers
        .split(hasCustomDelimiter ? RegExp('[$delimiter\n]') : RegExp(r'[,\n]'))
        .where((s) => s.isNotEmpty)
        .toList();

    List<int> negatives = [];
    List<int> validNumbers = [];

    for (String numStr in numberString) {
      int num = int.parse(numStr);
      if (num < 0) {
        negatives.add(num);
      } else if (num <= 1000) {
        validNumbers.add(num);
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(', ')}');
    }

    return validNumbers.isEmpty ? 0 : validNumbers.reduce((a, b) => a + b);
  }
}
