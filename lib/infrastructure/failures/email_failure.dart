import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_failure.freezed.dart';

@freezed
abstract class EmailFailure with _$EmailFailure {
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory EmailFailure.serverError() = ServerError;

  const factory EmailFailure.networkError() = NetworkError;
}