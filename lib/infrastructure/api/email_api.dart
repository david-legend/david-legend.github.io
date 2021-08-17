import 'dart:convert';

import 'package:aerium/infrastructure/failures/email_failure.dart';
import 'package:http/http.dart' as http;
import 'package:aerium/values/values.dart';

import 'email_model.dart';

abstract class EmailApi {
  ///portfolio-api-chi.vercel.app/api/getintouch
  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  final http.Client client;

  EmailApiImpl({required this.client});

  Future<Email> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    // Map<String, dynamic> headers = {
    //    "Content-Type": "application/json",
    //       "Access-Control-Allow-Origin":
    //           "*", // Required for CORS support to work
    //       "Access-Control-Allow-Credentials":
    //           true, // Required for cookies, authorization headers with HTTPS
    //       "Access-Control-Allow-Headers":
    //           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //       "Access-Control-Allow-Methods": "POST, OPTIONS"
    // };
    try {
      final response = await client.post(
        Uri.parse(StringConst.BASE_URL + StringConst.GET_IN_TOUCH_POINT),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              "*", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
        }),
      );

      print("Status Code ${response}");
      print("Body ${response.body}");
      if (response.statusCode == 200) {
        return Email.fromJson(json.decode(response.body));
      } else {
        throw EmailFailure.serverError();
      }
    } catch (e) {
      print("Error  ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}
