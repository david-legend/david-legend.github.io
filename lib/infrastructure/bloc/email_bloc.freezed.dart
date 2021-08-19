// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmailEventTearOff {
  const _$EmailEventTearOff();

  SendEmail sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) {
    return SendEmail(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );
  }
}

/// @nodoc
const $EmailEvent = _$EmailEventTearOff();

/// @nodoc
mixin _$EmailEvent {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String email, String subject, String message)
        sendEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String subject, String message)?
        sendEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEmail value) sendEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEmail value)? sendEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailEventCopyWith<EmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailEventCopyWith<$Res> {
  factory $EmailEventCopyWith(
          EmailEvent value, $Res Function(EmailEvent) then) =
      _$EmailEventCopyWithImpl<$Res>;
  $Res call({String name, String email, String subject, String message});
}

/// @nodoc
class _$EmailEventCopyWithImpl<$Res> implements $EmailEventCopyWith<$Res> {
  _$EmailEventCopyWithImpl(this._value, this._then);

  final EmailEvent _value;
  // ignore: unused_field
  final $Res Function(EmailEvent) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? subject = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SendEmailCopyWith<$Res> implements $EmailEventCopyWith<$Res> {
  factory $SendEmailCopyWith(SendEmail value, $Res Function(SendEmail) then) =
      _$SendEmailCopyWithImpl<$Res>;
  @override
  $Res call({String name, String email, String subject, String message});
}

/// @nodoc
class _$SendEmailCopyWithImpl<$Res> extends _$EmailEventCopyWithImpl<$Res>
    implements $SendEmailCopyWith<$Res> {
  _$SendEmailCopyWithImpl(SendEmail _value, $Res Function(SendEmail) _then)
      : super(_value, (v) => _then(v as SendEmail));

  @override
  SendEmail get _value => super._value as SendEmail;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? subject = freezed,
    Object? message = freezed,
  }) {
    return _then(SendEmail(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendEmail implements SendEmail {
  const _$SendEmail(
      {required this.name,
      required this.email,
      required this.subject,
      required this.message});

  @override
  final String name;
  @override
  final String email;
  @override
  final String subject;
  @override
  final String message;

  @override
  String toString() {
    return 'EmailEvent.sendEmail(name: $name, email: $email, subject: $subject, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendEmail &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SendEmailCopyWith<SendEmail> get copyWith =>
      _$SendEmailCopyWithImpl<SendEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String email, String subject, String message)
        sendEmail,
  }) {
    return sendEmail(name, email, subject, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String email, String subject, String message)?
        sendEmail,
    required TResult orElse(),
  }) {
    if (sendEmail != null) {
      return sendEmail(name, email, subject, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEmail value) sendEmail,
  }) {
    return sendEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEmail value)? sendEmail,
    required TResult orElse(),
  }) {
    if (sendEmail != null) {
      return sendEmail(this);
    }
    return orElse();
  }
}

abstract class SendEmail implements EmailEvent {
  const factory SendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) = _$SendEmail;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get subject => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SendEmailCopyWith<SendEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EmailStateTearOff {
  const _$EmailStateTearOff();

  Initial initial() {
    return const Initial();
  }

  SendingEmail sendingEmail() {
    return const SendingEmail();
  }

  Failure failure() {
    return const Failure();
  }

  EmailSentSuccessFully emailSentSuccessFully() {
    return const EmailSentSuccessFully();
  }
}

/// @nodoc
const $EmailState = _$EmailStateTearOff();

/// @nodoc
mixin _$EmailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingEmail,
    required TResult Function() failure,
    required TResult Function() emailSentSuccessFully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingEmail,
    TResult Function()? failure,
    TResult Function()? emailSentSuccessFully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SendingEmail value) sendingEmail,
    required TResult Function(Failure value) failure,
    required TResult Function(EmailSentSuccessFully value)
        emailSentSuccessFully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SendingEmail value)? sendingEmail,
    TResult Function(Failure value)? failure,
    TResult Function(EmailSentSuccessFully value)? emailSentSuccessFully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailStateCopyWith<$Res> {
  factory $EmailStateCopyWith(
          EmailState value, $Res Function(EmailState) then) =
      _$EmailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailStateCopyWithImpl<$Res> implements $EmailStateCopyWith<$Res> {
  _$EmailStateCopyWithImpl(this._value, this._then);

  final EmailState _value;
  // ignore: unused_field
  final $Res Function(EmailState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'EmailState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingEmail,
    required TResult Function() failure,
    required TResult Function() emailSentSuccessFully,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingEmail,
    TResult Function()? failure,
    TResult Function()? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SendingEmail value) sendingEmail,
    required TResult Function(Failure value) failure,
    required TResult Function(EmailSentSuccessFully value)
        emailSentSuccessFully,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SendingEmail value)? sendingEmail,
    TResult Function(Failure value)? failure,
    TResult Function(EmailSentSuccessFully value)? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements EmailState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $SendingEmailCopyWith<$Res> {
  factory $SendingEmailCopyWith(
          SendingEmail value, $Res Function(SendingEmail) then) =
      _$SendingEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendingEmailCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $SendingEmailCopyWith<$Res> {
  _$SendingEmailCopyWithImpl(
      SendingEmail _value, $Res Function(SendingEmail) _then)
      : super(_value, (v) => _then(v as SendingEmail));

  @override
  SendingEmail get _value => super._value as SendingEmail;
}

/// @nodoc

class _$SendingEmail implements SendingEmail {
  const _$SendingEmail();

  @override
  String toString() {
    return 'EmailState.sendingEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendingEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingEmail,
    required TResult Function() failure,
    required TResult Function() emailSentSuccessFully,
  }) {
    return sendingEmail();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingEmail,
    TResult Function()? failure,
    TResult Function()? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (sendingEmail != null) {
      return sendingEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SendingEmail value) sendingEmail,
    required TResult Function(Failure value) failure,
    required TResult Function(EmailSentSuccessFully value)
        emailSentSuccessFully,
  }) {
    return sendingEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SendingEmail value)? sendingEmail,
    TResult Function(Failure value)? failure,
    TResult Function(EmailSentSuccessFully value)? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (sendingEmail != null) {
      return sendingEmail(this);
    }
    return orElse();
  }
}

abstract class SendingEmail implements EmailState {
  const factory SendingEmail() = _$SendingEmail;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure();

  @override
  String toString() {
    return 'EmailState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingEmail,
    required TResult Function() failure,
    required TResult Function() emailSentSuccessFully,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingEmail,
    TResult Function()? failure,
    TResult Function()? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SendingEmail value) sendingEmail,
    required TResult Function(Failure value) failure,
    required TResult Function(EmailSentSuccessFully value)
        emailSentSuccessFully,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SendingEmail value)? sendingEmail,
    TResult Function(Failure value)? failure,
    TResult Function(EmailSentSuccessFully value)? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements EmailState {
  const factory Failure() = _$Failure;
}

/// @nodoc
abstract class $EmailSentSuccessFullyCopyWith<$Res> {
  factory $EmailSentSuccessFullyCopyWith(EmailSentSuccessFully value,
          $Res Function(EmailSentSuccessFully) then) =
      _$EmailSentSuccessFullyCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailSentSuccessFullyCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res>
    implements $EmailSentSuccessFullyCopyWith<$Res> {
  _$EmailSentSuccessFullyCopyWithImpl(
      EmailSentSuccessFully _value, $Res Function(EmailSentSuccessFully) _then)
      : super(_value, (v) => _then(v as EmailSentSuccessFully));

  @override
  EmailSentSuccessFully get _value => super._value as EmailSentSuccessFully;
}

/// @nodoc

class _$EmailSentSuccessFully implements EmailSentSuccessFully {
  const _$EmailSentSuccessFully();

  @override
  String toString() {
    return 'EmailState.emailSentSuccessFully()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailSentSuccessFully);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingEmail,
    required TResult Function() failure,
    required TResult Function() emailSentSuccessFully,
  }) {
    return emailSentSuccessFully();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingEmail,
    TResult Function()? failure,
    TResult Function()? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (emailSentSuccessFully != null) {
      return emailSentSuccessFully();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(SendingEmail value) sendingEmail,
    required TResult Function(Failure value) failure,
    required TResult Function(EmailSentSuccessFully value)
        emailSentSuccessFully,
  }) {
    return emailSentSuccessFully(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(SendingEmail value)? sendingEmail,
    TResult Function(Failure value)? failure,
    TResult Function(EmailSentSuccessFully value)? emailSentSuccessFully,
    required TResult orElse(),
  }) {
    if (emailSentSuccessFully != null) {
      return emailSentSuccessFully(this);
    }
    return orElse();
  }
}

abstract class EmailSentSuccessFully implements EmailState {
  const factory EmailSentSuccessFully() = _$EmailSentSuccessFully;
}
