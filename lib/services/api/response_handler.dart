import 'dart:convert';
import 'package:ezy_invoify/services/api/constants.dart';
import 'package:ezy_invoify/services/api/failure.dart';
import 'package:ezy_invoify/services/localStorage/local_storage.dart';
import 'package:ezy_invoify/widgets/unauth_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiResponseHandler {
  static Future<Map<String, dynamic>?> handleResponse(
    http.Response response,
    BuildContext? context,
  ) async {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    String? message;
    for (var key in [
      RequestStatus.MESSAGE,
      RequestStatus.SUCCESS,
      RequestStatus.DATA,
      RequestStatus.EMPTY,
      RequestStatus.NOTFOUND,
      RequestStatus.ERROR,
      RequestStatus.VALIDATION_ERROR,
      RequestStatus.REQUEST_ERROR,
      RequestStatus.REQUEST_INVALID,
      RequestStatus.AUTHENTICATION_ERROR,
      RequestStatus.UNAUTHENTICATED,
    ]) {
      if (data.keys.first == (key)) {
        message = key;
        break;
      }
    }
    switch (message) {
      case SUCCESS || DATA || MESSAGE:
        return data;
      case EMPTY:
        throw Failure(data[message] ?? "No data available");
      case UNAUTHENTICATED:
        LocalStorage.clearToken();
        if (context != null) {
          await showDialog(
            context: context,
            builder: (context) => const UnauthWidgetDialog(),
          );
        }
        return null;
      case NOTFOUND:
        throw Failure(data[message] ?? "Request not found");
      case ERROR:
        throw Failure(data[message] ?? "Unknown error occurred");
      case VALIDATION_ERROR:
        throw Failure("Validation error: ${data[message]}");
      case REQUEST_ERROR:
        throw Failure("Request error: ${data[message]}");
      case REQUEST_INVALID:
        throw Failure("An error has occured ");
      case AUTHENTICATION_ERROR:
        throw Failure("Authentication error: ${data[message]}");
      default:
        throw Failure("${data[message]}");
    }
  }
}
