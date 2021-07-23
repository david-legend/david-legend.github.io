import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:aerium/core/errors/email_failure.dart';
import 'package:aerium/infrastructure/email/email_model.dart';

import 'email_api.dart';

abstract class EmailRepository {
  Future<Either<EmailFailure, Email>> sendEmail({
    @required String email,
    @required String message,
    String phoneNumber,
    String name,
  });
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({
    @required this.emailApi,
  });

  @override
  Future<Either<EmailFailure, Email>> sendEmail({
    @required String email,
    @required String message,
    String phoneNumber,
    String name,
  }) async {
    try {
      final emailStatus = await emailApi.sendEmail(
        email: email,
        message: message,
        phoneNumber: phoneNumber,
        name: name,
      );
      return Right(emailStatus);
    } catch (e) {
      print(e.toString());
      if (e == EmailFailure.serverError()) {
        return Left(EmailFailure.serverError());
      } else {
        return Left(EmailFailure.networkError());
      }
    }
  }
}
