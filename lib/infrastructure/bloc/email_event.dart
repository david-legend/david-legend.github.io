part of 'email_bloc.dart';

@freezed
abstract class EmailEvent with _$EmailEvent {
  const factory EmailEvent.sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) = SendEmail;
}