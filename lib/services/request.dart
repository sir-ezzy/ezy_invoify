import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ezy_invoify/services/api/failure.dart';
import 'package:ezy_invoify/services/api/response_handler.dart';
import 'package:ezy_invoify/services/localstorage/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger();

const String baseurl = "https://api.hubli.ng";

Future<Map<String, dynamic>?> postRequest(
  http.Client client,
  String endpoint,
  dynamic body,
  bool parseToken,
) async {
  var token = LocalStorage.getToken();
  Logger().e(body);
  Logger().e(token);
  try {
    print("$baseurl$endpoint");

    final response = await client
        .post(
          Uri.parse("$baseurl$endpoint"),
          body: jsonEncode(body),
          headers: parseToken == true
              ? {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                  "Authorization": "Bearer $token",
                }
              : {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                },
        )
        .timeout(const Duration(seconds: 60));
    return ApiResponseHandler.handleResponse(response);
  } on SocketException catch (_) {
    throw Failure("No internet connection");
  } on HttpException catch (_) {
    throw Failure("Service not currently available");
  } on TimeoutException catch (_) {
    throw Failure("Poor internet connection");
  } catch (e) {
    print(e.toString());
    throw Failure(e.toString());
  }
}

Future<Map<String, dynamic>?> getRequest(
  http.Client client,
  String endpoint,
  bool parseToken,
) async {
  var token = LocalStorage.getToken();
  logger.e("This is the token $token");

  try {
    print("$baseurl$endpoint");

    final response = await client
        .get(
          Uri.parse("$baseurl$endpoint"),
          headers: parseToken
              ? {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                  "Authorization": "Bearer $token",
                }
              : {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                },
        )
        .timeout(const Duration(seconds: 60));
    return ApiResponseHandler.handleResponse(response);
  } on SocketException catch (_) {
    throw Failure("No internet connection");
  } on HttpException catch (_) {
    throw Failure("Service not currently available");
  } on TimeoutException catch (_) {
    throw Failure("Poor internet connection");
  } catch (e) {
    print(e.toString());
    throw Failure("Something went wrong. Try again");
  }
}
