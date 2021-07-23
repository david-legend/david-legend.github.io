part of 'email_bloc.dart';

@freezed
abstract class EmailEvent with _$EmailEvent {
  const factory EmailEvent.sendEmail({
    @required String email,
    @required String message,
    String phoneNumber,
    String name,
  }) = SendEmail;
}
