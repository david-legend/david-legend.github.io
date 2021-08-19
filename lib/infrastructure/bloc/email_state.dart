part of 'email_bloc.dart';

@freezed
abstract class EmailState with _$EmailState {
  const factory EmailState.initial() = Initial;

  const factory EmailState.sendingEmail() = SendingEmail;
  const factory EmailState.failure() = Failure;

  const factory EmailState.emailSentSuccessFully() = EmailSentSuccessFully;
}