import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';



class CustomSnackBar {
  static BuildContext? _context;

  // Initialize context (call this in main.dart or when app starts)
  static void init(BuildContext context) {
    _context = context;
  }

  static void show({
    String title = "",
    required String message,
    required ContentType contentType,
  }) {
    if (_context == null) {
      debugPrint("CustomSnackBar: Context is not initialized!");
      return;
    }

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: ZoomIn(
        child: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: contentType,
        ),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(_context!).size.height - 220,
        left: 10,
        right: 10,
      ),
    );

    ScaffoldMessenger.of(_context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
