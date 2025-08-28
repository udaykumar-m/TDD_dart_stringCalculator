# String Calculator

## Requirements Checklist

- [✔] **Basic Functionality**: Create a simple String calculator with method signature `int Add(string numbers)`
- [✔] **Empty String**: Return 0 for empty string input
- [✔] **Single Number**: Handle single number input (e.g., "1")
- [✔] **Two Numbers**: Handle two comma-separated numbers (e.g., "1,2")
- [✔] **Multiple Numbers**: Allow unknown amount of numbers
- [✔] **Newline Delimiters**: Handle newlines between numbers (e.g., "1\n2,3")
- [✔] **Custom Delimiters**: Support different delimiters with format "//[delimiter]\n[numbers...]"
- [✔] **Negative Validation**: Throw exception for negative numbers with message "negatives not allowed"
- [✔] **Multiple Negatives**: Show all negative numbers in exception message
- [✔] **Number Range**: Ignore numbers bigger than 1000
- [✔] **Long Delimiters**: Support delimiters of any length (e.g., "//[***]\n1**_2_**3")
- [✔] **Multiple Delimiters**: Allow multiple delimiters (e.g., "//[\*][%]\n1\*2%3")
- [✔] **Long Multiple Delimiters**: Handle multiple delimiters with length longer than one character

## Commands to Run

### Run Tests

```bash
dart test
```

## Test Cases

Here's a comprehensive list of all test cases covering the String Calculator functionality:
Below is a summary table of all test cases implemented in `test/string_calculator_test.dart`. Each test covers a specific requirement or edge case for the String Calculator:

| #   | Description                                         | Input Example                  | Expected Output / Behavior                           |
| --- | --------------------------------------------------- | ------------------------------ | ---------------------------------------------------- |
| 1   | Returns 0 for empty string                          | `""`                           | `0`                                                  |
| 2   | Returns value for single number                     | `"1"`                          | `1`                                                  |
| 3   | Returns sum for two numbers                         | `"1,2"`                        | `3`                                                  |
| 4   | Returns sum for multiple numbers                    | `"1,2,3,4,5,6"`                | `21`                                                 |
| 5   | Handles newlines as delimiters                      | `"1\n2\n3"`                    | `6`                                                  |
| 6   | Handles mixed comma and newline delimiters          | `"1,2\n3,4"`                   | `10`                                                 |
| 7   | Ignores empty entries between delimiters            | `"1,2,\n,3,4"`                 | `10`                                                 |
| 8   | Handles multiple consecutive empty entries          | `"1,2,\n,,,,,\n\n\n\n,3,4"`    | `10`                                                 |
| 9   | Supports custom delimiter (semicolon)               | `"//;\n1;2"`                   | `3`                                                  |
| 10  | Supports custom delimiter (asterisk)                | `"//*\n1*2*3"`                 | `6`                                                  |
| 11  | Supports multi-character custom delimiter           | `"//*;\n1;2;3"`                | `6`                                                  |
| 12  | Handles mixed usage of custom delimiter             | `"//*;\n1;2*3"`                | `6`                                                  |
| 13  | Returns 0 and prints error for missing newline      | `"//;1;2;3"`                   | `0` (prints error message)                           |
| 14  | Handles empty delimiter specification               | `"//\n123"`                    | `123`                                                |
| 15  | Uses default delimiters when custom is empty        | `"//\n1,2,3"`                  | `6` (prints error message)                           |
| 16  | Throws exception for negative numbers               | `"1,-2,3,-4,5,-6"`             | Exception                                            |
| 17  | Exception message lists all negative numbers        | `"1,-2,3,-4,5,-6"`             | Exception: "negative numbers not allowed -2, -4, -6" |
| 18  | Negative validation with custom delimiter           | `"//;\n1;-2;3"`                | Exception: "negative numbers not allowed -2"         |
| 19  | Includes numbers exactly 1000 or less               | `"1,1000,2"`                   | `1003`                                               |
| 20  | Ignores numbers greater than 1000                   | `"2,1001"`                     | `2`                                                  |
| 21  | Range validation with custom delimiters             | `"//;\n1;1000;2;2000;3;10001"` | `1006`                                               |
| 22  | Supports multi-character bracket delimiter          | `"//[***]\n1***2***3"`         | `6`                                                  |
| 23  | Handles empty bracket delimiter                     | `"//[]\n123"`                  | `123`                                                |
| 24  | Error for missing newline with bracket delimiter    | `"//[;%]1;2;3"`                | `0` (prints error message)                           |
| 25  | Uses default delimiters with empty brackets         | `"//[]\n1,2,3"`                | `6`                                                  |
| 26  | Handles special regex characters in delimiter       | `"//[**]\n1**2**3"`            | `6`                                                  |
| 27  | Supports multiple single-character delimiters       | `"//[*][%]\n1*2%3"`            | `6`                                                  |
| 28  | Supports multiple multi-character delimiters        | `"//[***][%%%]\n1***2%%%3"`    | `6`                                                  |
| 29  | Handles mixed single and multi-character delimiters | `"//[@][%%]\n1@2%%3"`          | `6`                                                  |
| 30  | Handles empty and custom bracket delimiters         | `"//[][*%]\n123"`              | `123`                                                |
| 31  | Handles multiple empty bracket delimiters           | `"//[][]\n123"`                | `123`                                                |

See the `test/string_calculator_test.dart` file for the full implementation of these tests.

## Project Structure

```
string_calculator/
├── lib/
│   └── string_calculator.dart    # Main implementation
├── test/
│   └── string_calculator_test.dart # Test cases
├── bin/
│   └── string_calculator.dart    # Entry point
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```
