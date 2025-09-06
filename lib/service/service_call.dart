import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as pth;

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  static Map userObj = {};
  static int userType = 1;

  /// Common error handler
  static void _handleError(dynamic e, ResFailure? failure) {
    if (failure != null) failure(e.toString());
  }

  /// Common JSON parser
  static void _parseResponse(String body, ResSuccess? success, ResFailure? failure) {
    try {
      if (kDebugMode) print(body);
      final jsonObj = json.decode(body) as Map<String, dynamic>? ?? {};
      if (success != null) success(jsonObj);
    } catch (e) {
      _handleError(e, failure);
    }
  }

  /// Normal POST API call
  static void post(
      Map<String, dynamic> parameter,
      String path, {
        bool isTokenApi = false,
        ResSuccess? withSuccess,
        ResFailure? failure,
      }) {
    Future(() async {
      try {
        final headers = {
          "Content-Type": "application/x-www-form-urlencoded",
          if (isTokenApi) "access_token": userObj["auth_token"] as String? ?? ""
        };

        final response = await http.post(Uri.parse(path), body: parameter, headers: headers);
        _parseResponse(response.body, withSuccess, failure);
      } on SocketException catch (e) {
        _handleError(e, failure);
      } catch (e) {
        _handleError(e, failure);
      }
    });
  }

  /// Multipart API call
  static void multipart(
      Map<String, String> parameter,
      String path, {
        bool isTokenApi = false,
        Map<String, File>? imgObj,
        ResSuccess? withSuccess,
        ResFailure? failure,
      }) {
    Future(() async {
      try {
        final request = http.MultipartRequest('POST', Uri.parse(path))
          ..fields.addAll(parameter)
          ..headers.addAll({
            if (isTokenApi) "access_token": userObj["auth_token"] as String? ?? ""
          });

        if (kDebugMode) {
          print('Service Call: $path');
          print('Service parm: $parameter');
          print('Service header: ${request.headers}');
        }

        if (imgObj != null) {
          for (var entry in imgObj.entries) {
            final file = entry.value;
            final multipartFile = http.MultipartFile(
              entry.key,
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: pth.basename(file.path),
            );
            request.files.add(multipartFile);
          }
        }

        final response = await request.send();
        final body = await response.stream.transform(utf8.decoder).join();
        _parseResponse(body, withSuccess, failure);
      } on SocketException catch (e) {
        _handleError(e, failure);
      } catch (e) {
        _handleError(e, failure);
      }
    });
  }
}
