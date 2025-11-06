import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final List<int> validPositions = [
      0,
      1,
      2,
      3,
      5,
      6,
      8,
      9
    ]; // Valid positions for digits
    final StringBuffer newText = StringBuffer();

    for (int i = 0; i < newValue.text.length; i++) {
      final String char = newValue.text[i];
      if (validPositions.contains(i) && char != '-') {
        newText.write(char);
        if (newText.length == 4 || newText.length == 7) {
          newText.write('-');
        }
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
