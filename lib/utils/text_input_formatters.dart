import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove non-digit characters from the input text
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Parse the cleaned text as a double value
    double value = double.parse(cleanedText);

    // Create a NumberFormat instance for formatting the currency
    final formatter = NumberFormat('#,###');

    // Format the value with commas
    String newText = formatter.format(value);

    // Return the new TextEditingValue with formatted text and updated cursor position
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
