import 'package:aerium/infrastructure/failures/email_failure.dart';
import 'package:dartz/dartz.dart';

import 'email_api.dart';
import 'email_model.dart';

abstract class EmailRepository {
  Future<Either<EmailFailure, Email>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({
    required this.emailApi,
  });

  @override
  Future<Either<EmailFailure, Email>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final emailStatus = await emailApi.sendEmail(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );
      print(emailStatus);
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