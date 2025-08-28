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
}
