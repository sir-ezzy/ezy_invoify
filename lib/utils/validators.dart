import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Validation {
  static String getFormattedTimeDate(DateTime date) {
    var formatter = DateFormat('dd MMM yyyy - hh:mm:ss');
    final dateFormatted = formatter.format(date);
    return dateFormatted;
  }

  static String getPostFormattedDate(String date,
      [bool isWithoutTime = false]) {
    try {
      DateTime formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date);
      var formatter = isWithoutTime
          ? DateFormat('dd-MMM-yyyy')
          : DateFormat('dd-MMM-yyyy HH:mm:ss');
      final resultDate = formatter.format(formattedDate);
      return resultDate;
    } catch (e) {
      log(e.toString());
      return date;
    }
  }

  static String getFormattedTime(String date) {
    try {
      DateTime formattedDate = DateTime.parse(date);
      String formattedTime = DateFormat.jm().format(formattedDate);
      log(formattedTime);
      return formattedTime;
    } catch (e) {
      log(e.toString());
      return date;
    }
  }

  static int getFormattedAmount(String amount) {
    final amt =
        amount.replaceAll(RegExp(r'N\s|\,|\.00|NGN|USD|GBP|EUR|\s+'), "");
    return int.parse(amt);
  }

  static String removeCurrencySymbol(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|NGN|USD|GBP|EUR|\s+|\,'), "");
    return amt;
  }

  static double getFormattedAmountDouble(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|\,|NGN|USD|GBP|EUR|\s+'), "");
    return double.parse(amt);
  }

  static bool isPasswordLengthCompliant(String password, int length) {
    return password.length >= length ? true : false;
  }

  static bool containsUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]')) ? true : false;
  }

  static bool containsDigits(String password) {
    return password.contains(RegExp(r'.*\d.*')) ? true : false;
  }

  static bool containsSpecialCharater(String password) {
    return password.contains(RegExp(r'\W')) ? true : false;
  }

  static String? validateConfirmPassword(
      String newPassword, String confirmNewPassword, int length) {
    if (confirmNewPassword.isEmpty) {
      return "Passwords cannot be empty";
    }

    if (confirmNewPassword.trim().length < length) {
      return "Password length must be greater than $length characters";
    }

    if (newPassword != confirmNewPassword) {
      return "Passwords do not match";
    }

    if (!confirmNewPassword.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }

    if (!newPassword.contains(RegExp(r'\W'))) {
      return "Password must contain a symbol";
    }

    if (!newPassword.contains(RegExp(r'[\d]'))) {
      return "Password must contain a number";
    }
    return null;
  }

  static String? validatePassword(String password, int length) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    }

    if (password.length < length) {
      return "Password length must be $length characters";
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }

    if (!password.contains(RegExp(r'\W'))) {
      return "Password must contain a symbol";
    }

    if (!password.contains(RegExp(r'[\d]'))) {
      return "Password must contain a number";
    }
    return null;
  }

  static String? validateNewPassword(
      String currentPassword, String newPassword, int length) {
    if (newPassword.trim().isEmpty) {
      return "Passwords cannot be empty";
    }

    if (newPassword.trim() == currentPassword.trim()) {
      return "New password must be different";
    }

    if (newPassword.trim().length < length) {
      return "Password length must be $length characters";
    }

    if (!newPassword.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }

    if (!newPassword.contains(RegExp(r'\W'))) {
      return "Password must contain a symbol";
    }

    if (!newPassword.contains(RegExp(r'[\d]'))) {
      return "Password must contain a number";
    }
    return null;
  }

  static String? checkNewPassword(
      String currentPassword, String newPassword, int length) {
    if (newPassword.trim().isEmpty) {
      return "Passwords cannot be empty";
    }

    if (newPassword.trim() != currentPassword.trim()) {
      if (currentPassword.length < length) {
        return "Password length must be $length characters";
      }

      if (!currentPassword.contains(RegExp(r'[A-Z]'))) {
        return "Password must contain upper case";
      }

      if (!currentPassword.contains(RegExp(r'\W'))) {
        return "Password must contain a symbol";
      }

      if (!currentPassword.contains(RegExp(r'[\d]'))) {
        return "Password must contain a number";
      }
    }
    if (newPassword.trim() == currentPassword.trim()) {
      return "New password must be different";
    }
    return null;
  }

  static String? confirmNewPassword(
      String newPassword, String confirmPassword) {
    if (confirmPassword.trim().isEmpty) {
      return "Passwords cannot be empty";
    }

    if (newPassword.trim() != confirmPassword.trim()) {
      return "Passwords do not match";
    }
    return null;
  }

  static String removeCommaFromString(String amount) {
    String amountString = amount.replaceAll(',', '');
    return amountString;
  }

  static String? checkUserInput(String inputName, String value, int minLength) {
    if (value.trim().isEmpty) {
      return '$inputName can not be empty';
    } else if (value.trim().length < minLength) {
      return '$inputName should be a minimum of $minLength characters';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return "Password must contain at least one letter";
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    return null; // Password is valid
  }

//  todo: Input Validators
  static bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  static String? validateName(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateNumber(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r'^[-0-9 ]+$');
    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only numeric characters.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r'^(?:[+0])?[0-9]{10}$');
    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only correct phone number.';
    }
    if (value.trim().length != 11 && value.trim().length != 10) {
      return 'Field must be of 10 or 11 digits';
    } else {
      return null;
    }
  }

  static String? validateString(dynamic value) {
    // Regular expression to match any special characters
    RegExp noScriptRegex = RegExp(r"^[^<>\[\]\\^`{|}]+$");
    if (value.toString().trim().isEmpty) {
      return 'Please enter some text';
    } else if (!noScriptRegex.hasMatch(value.toString().trim())) {
      return 'Invalid input';
    } else {
      return null;
    }
  }

  //Created another one because of fixed savings.
  static String? validateString2(dynamic value) {
    // Regular expression to match any special characters
    RegExp noScriptRegex = RegExp(r"^[^<>\[\]\\^`{|}]+$");
    if (value.toString().trim().isEmpty) {
      return 'This Field is empty';
    } else if (!noScriptRegex.hasMatch(value.toString().trim())) {
      return 'Invalid input';
    } else {
      return null;
    }
  }

  static bool spinnerVaidation(
      BuildContext context, TextEditingController controller, String text) {
    if (controller.text.isEmpty || controller.text == "") {
      log(controller.text);

      return false;
    } else {
      return true;
    }
  }

  static String? pinValidator(BuildContext context, String text) {
    int trimmedTextLength = text.trim().length;
    if (text.trim().isEmpty) return 'Field is required.';
    if (trimmedTextLength < 4 || trimmedTextLength > 4) {
      return "Pin field must be 4 digits";
    }
    return null;
  }

  static String? codeValidator(BuildContext context, String text) {
    int trimmedTextLength = text.trim().length;
    if (text.trim().isEmpty) return 'Field is required.';
    if (trimmedTextLength < 6 || trimmedTextLength > 6) {
      return "Code field must be 6 digits";
    }
    final RegExp nameExp = RegExp(r'^[-0-9 ]+$');
    if (!nameExp.hasMatch(text.trim())) {
      return 'Please enter only numeric characters.';
    } else {
      return null;
    }
  }

  static String? newPinValidator(
      BuildContext context, String oldPin, String newPin) {
    int trimmedTextLength = oldPin.trim().length;
    if (newPin.trim().isEmpty) return 'Field is required.';
    if (trimmedTextLength < 4 || trimmedTextLength > 4) {
      return "Pin field must be 4 digits";
    }
    if (oldPin.trim() == newPin.trim()) {
      return "Your new pin must be different from your current pin.";
    }
    return null;
  }

  static String? confirmNewPinValidator(
      BuildContext context, String confirmPin, String currentPin) {
    log("ref $confirmPin and $currentPin");
    int trimmedTextLength = confirmPin.trim().length;

    if (confirmPin.trim().isEmpty) return 'Field is required.';
    if (trimmedTextLength < 4 || trimmedTextLength > 4) {
      return "Pin field must be 4 digits";
    }
    if (confirmPin.trim() != currentPin.trim()) {
      return "Your new pin doesn't correspond";
    }
    if (confirmPin.trim() == currentPin.trim()) {
      return null;
    }
    return null;
  }

  static String? accountNumber(String controller) {
    String trimmed = controller.trim();
    if (trimmed.length < 10) {
      return "Account number must be 10 digits";
    }
    return null;
  }
}
