import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:aerium/values/values.dart';
import 'package:aerium/core/errors/email_failure.dart';

import 'email_model.dart';

abstract class EmailApi {
  ///https://asqbx1u5bg.execute-api.us-east-1.amazonaws.com/production/send endpoint
  Future<Email> sendEmail({
    @required String email,
    @required String message,
    String phoneNumber,
    String name,
  });
}

class EmailApiImpl implements EmailApi {
  final http.Client client;

  EmailApiImpl({@required this.client});

  Future<Email> sendEmail({
    @required String email,
    @required String message,
    String phoneNumber,
    String name,
  }) async {
    final response = await client.post(
      StringConst.BASE_URL + StringConst.SEND_END_POINT,
      headers: {
//        "Accept": "application/json",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode({
        "email": email,
        "message": message,
        "name": name,
        "mobile": phoneNumber,
      }),
    );

    print("Status Code ${response.statusCode}");
    print("Body ${response.body}");
    if (response.statusCode == 200) {
      return Email.fromJson(json.decode(response.body));
    } else {
      throw EmailFailure.serverError();
    }
  }
}
