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
    try {
      final response = await client.post(
        Uri.parse(StringConst.BASE_URL + StringConst.GET_IN_TOUCH_POINT),
       
        body: jsonEncode({
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
        }),
      );

    
      if (response.statusCode == 200) {
        return Email(status: "success");
      } else {
        throw EmailFailure.serverError();
      }
    } catch (e) {
      print("Error  ${e.toString()}");
      throw EmailFailure.serverError();
    }
  }
}
