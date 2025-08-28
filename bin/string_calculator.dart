import 'package:string_calculator/string_calculator.dart';
import 'dart:io';

void main(List<String> arguments) {
  final calculator = StringCalculator();

  print('String Calculator');
  print('================');
  print('Enter numbers or type "quit" to exit');

  while (true) {
    stdout.write('Enter numbers: ');
    final input = stdin.readLineSync();

    if (input?.toLowerCase() == 'quit') {
      print('Bye!');
      break;
    }

    try {
      final result = calculator.add(input ?? '');
      print('Result: $result');
    } catch (e) {
      print('Error: $e');
    }
    print('');
  }
}
