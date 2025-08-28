import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('empty string should return 0', () {
    expect(StringCalculator().add(''), 0);
  });

  test('single number should return the number', () {
    expect(StringCalculator().add('1'), 1);
  });

  test('two numbers should return their sum', () {
    expect(StringCalculator().add('1,2'), 3);
  });

  test('multiple numbers should return their sum', () {
    expect(StringCalculator().add('1,2,3,4,5,6'), 21);
  });

  test('calculator should handle newlines instead of commas', () {
    expect(StringCalculator().add('1\n2\n3'), 6);
  });

  test('calculator should handle commas and newlines', () {
    expect(StringCalculator().add('1,2\n3,4'), 10);
  });

  test('calculator should handle commas with newlines', () {
    expect(StringCalculator().add('1,2,\n,3,4'), 10);
  });

  test('calculator should handle multiple newlines and commas', () {
    expect(StringCalculator().add('1,2,\n,,,,,\n\n\n\n,3,4'), 10);
  });

  test('should handle custom delimiter with semicolon', () {
    expect(StringCalculator().add('//;\n1;2'), 3);
  });

  test('should handle custom delimiter', () {
    expect(StringCalculator().add('//*\n1*2*3'), 6);
  });

  test('should handle custom delimiter with multiple characters', () {
    expect(StringCalculator().add('//*;\n1;2;3'), 6);
  });

  test('should handle custom delimiter with multiple characters', () {
    expect(StringCalculator().add('//*;\n1;2*3'), 6);
  });

  test('should handle custom delimiter with no newline', () {
    expect(StringCalculator().add('//;1;2;3'), 0); //will print error message
  });

  test('should handle // with no delimiter', () {
    expect(StringCalculator().add('//\n123'), 123); //will print error message
  });

  test('should handle // with default delimiter', () {
    expect(StringCalculator().add('//\n1,2,3'), 6); //will print error message
  });
}
