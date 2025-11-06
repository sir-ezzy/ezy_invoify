import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:ezy_invoify/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

enum ToastType { success, error, info }

String nairaSymbol = 'N ';

class RandomFunction {
  static bool isLessThanAnHourAgo(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(dateTime);
    return difference.inHours < 1;
  }

  static Color getRandomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
    ];

    Random random = Random();
    return colors[random.nextInt(colors.length)];
  }

  static String greet() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);

    if (difference.inDays == 0) {
      // If the date is today
      return 'Today, $formattedTime';
    } else if (difference.inDays == 1) {
      // If the date is yesterday
      return 'Yesterday, $formattedTime';
    } else {
      // If the date is older than yesterday
      return '$formattedDate, $formattedTime';
    }
  }

  static void toast(ToastType type, String msg) {
    String title;
    ContentType contentType;

    switch (type) {
      case ToastType.success:
        title = "Success";
        contentType = ContentType.success;
        break;
      case ToastType.error:
        title = "Error";
        contentType = ContentType.failure;
        break;
      case ToastType.info:
        title = "Info";
        contentType = ContentType.help;
        break;
    }

    CustomSnackBar.show(title: title, message: msg, contentType: contentType);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime); // Formats time in "h:mm a" format
  }

  static String formatNumberToShortcut(String number) {
    try {
      double num =
          double.tryParse(number) ?? 0; // Default to 0 if parsing fails

      if (num >= 1000000) {
        double result = num / 1000000;
        String formatted = result.toStringAsFixed(
          1,
        ); // Ensure at least one decimal
        return formatted.endsWith(".0")
            ? '${formatted.substring(0, formatted.length - 2)}M'
            : '${formatted}M';
      } else if (num >= 1000) {
        double result = num / 1000;
        String formatted = result.toStringAsFixed(
          1,
        ); // Ensure at least one decimal
        return formatted.endsWith(".0")
            ? '${formatted.substring(0, formatted.length - 2)}k'
            : '${formatted}k';
      } else {
        if (num == num.toInt()) {
          return num.toInt()
              .toString(); // Return integer value without decimal part
        } else {
          return num.toString();
        }
      }
    } catch (e) {
      return number;
    }
  }

  static String timeAgo(String date) {
    var d = DateTime.parse(date);
    var result = GetTimeAgo.parse(d);
    return result;
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('MM/dd/yy').format(date);
  }

  static String formatDateTimeFromString(String date) {
    return DateFormat('MM/dd/yy').format(DateTime.parse(date));
  }

  static String timeAgo2(String date) {
    var d = DateTime.parse(date);
    var result = timeago.format(d);
    return result;
  }

  static String formatDateTimeFull(DateTime dateTime) {
    String daySuffix(int day) {
      if (day >= 11 && day <= 13) {
        return 'th';
      }
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    String formattedDate = DateFormat("MMM d").format(dateTime);
    String suffix = daySuffix(dateTime.day);
    String formattedTime = DateFormat("h:mm a").format(dateTime).toLowerCase();

    return "$formattedDate$suffix, ${dateTime.year}. $formattedTime";
  }

  static void loadUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // static void loadUrlWeb(String url) async {
  //   Get.to(WebviewScreen(url: url));
  // }

  static String convertFileToBase64String(File img) {
    List<int> imageBytes = img.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  static List<String> convertListFileToBase64String(List<File> img) {
    if (img.isEmpty) {
      return [];
    }
    List<String> base64Images = [];
    for (File image in img) {
      String base64Image = convertFileToBase64String(image);
      base64Images.add(base64Image);
    }
    return base64Images;
  }

  static Future callNumber(String phoneNumber) async {
    Uri url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> sendEmail(String emailAddress) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: emailAddress);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  static Future whatsappNumber(String phoneNumber) async {
    Uri url = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formatMoney(String amount) {
    // Remove any existing commas from the amount string
    String cleanAmount = amount.replaceAll(',', '');

    // Parse the string into an integer
    double parsedAmount = double.tryParse(cleanAmount) ?? 0;

    // Format the integer as a currency string with Naira symbol and comma separators
    String formattedAmount = parsedAmount
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );

    formattedAmount = '$nairaSymbol$formattedAmount';

    return formattedAmount;
  }

  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input; // Check for empty string
    return input[0].toUpperCase() + input.substring(1);
  }

  static void setStatusColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }

  static void resetStatusColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
  }

  static String formatDateChatPattern(DateTime date) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return '${_formatDay(date.day)} ${_getMonthName(date.month)}, ${date.year}';
    }
  }

  static String _formatDay(int day) {
    if (day == 1 || day == 21 || day == 31) {
      return '$day'
          'st';
    } else if (day == 2 || day == 22) {
      return '$day'
          'nd';
    } else if (day == 3 || day == 23) {
      return '$day'
          'rd';
    } else {
      return '$day'
          'th';
    }
  }

  static String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  static bool isDateBefore(String date1, String date2) {
    var date11 = DateTime.parse(date1);
    var date22 = DateTime.parse(date2);
    return date11.isBefore(date22);
  }
}
