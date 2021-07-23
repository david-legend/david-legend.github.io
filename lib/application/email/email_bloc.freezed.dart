// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$EmailEventTearOff {
  const _$EmailEventTearOff();

  SendEmail sendEmail(
      {@required String email,
      @required String message,
      String phoneNumber,
      String name}) {
    return SendEmail(
      email: email,
      message: message,
      phoneNumber: phoneNumber,
      name: name,
    );
  }
}

// ignore: unused_element
const $EmailEvent = _$EmailEventTearOff();

mixin _$EmailEvent {
  String get email;
  String get message;
  String get phoneNumber;
  String get name;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result sendEmail(
            String email, String message, String phoneNumber, String name),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result sendEmail(
        String email, String message, String phoneNumber, String name),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result sendEmail(SendEmail value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result sendEmail(SendEmail value),
    @required Result orElse(),
  });

  $EmailEventCopyWith<EmailEvent> get copyWith;
}

abstract class $EmailEventCopyWith<$Res> {
  factory $EmailEventCopyWith(
          EmailEvent value, $Res Function(EmailEvent) then) =
      _$EmailEventCopyWithImpl<$Res>;
  $Res call({String email, String message, String phoneNumber, String name});
}

class _$EmailEventCopyWithImpl<$Res> implements $EmailEventCopyWith<$Res> {
  _$EmailEventCopyWithImpl(this._value, this._then);

  final EmailEvent _value;
  // ignore: unused_field
  final $Res Function(EmailEvent) _then;

  @override
  $Res call({
    Object email = freezed,
    Object message = freezed,
    Object phoneNumber = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      message: message == freezed ? _value.message : message as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class $SendEmailCopyWith<$Res> implements $EmailEventCopyWith<$Res> {
  factory $SendEmailCopyWith(SendEmail value, $Res Function(SendEmail) then) =
      _$SendEmailCopyWithImpl<$Res>;
  @override
  $Res call({String email, String message, String phoneNumber, String name});
}

class _$SendEmailCopyWithImpl<$Res> extends _$EmailEventCopyWithImpl<$Res>
    implements $SendEmailCopyWith<$Res> {
  _$SendEmailCopyWithImpl(SendEmail _value, $Res Function(SendEmail) _then)
      : super(_value, (v) => _then(v as SendEmail));

  @override
  SendEmail get _value => super._value as SendEmail;

  @override
  $Res call({
    Object email = freezed,
    Object message = freezed,
    Object phoneNumber = freezed,
    Object name = freezed,
  }) {
    return _then(SendEmail(
      email: email == freezed ? _value.email : email as String,
      message: message == freezed ? _value.message : message as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

class _$SendEmail implements SendEmail {
  const _$SendEmail(
      {@required this.email,
      @required this.message,
      this.phoneNumber,
      this.name})
      : assert(email != null),
        assert(message != null);

  @override
  final String email;
  @override
  final String message;
  @override
  final String phoneNumber;
  @override
  final String name;

  @override
  String toString() {
    return 'EmailEvent.sendEmail(email: $email, message: $message, phoneNumber: $phoneNumber, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(name);

  @override
  $SendEmailCopyWith<SendEmail> get copyWith =>
      _$SendEmailCopyWithImpl<SendEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result sendEmail(
            String email, String message, String phoneNumber, String name),
  }) {
    assert(sendEmail != null);
    return sendEmail(email, message, phoneNumber, name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result sendEmail(
        String email, String message, String phoneNumber, String name),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(email, message, phoneNumber, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result sendEmail(SendEmail value),
  }) {
    assert(sendEmail != null);
    return sendEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result sendEmail(SendEmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendEmail != null) {
      return sendEmail(this);
    }
    return orElse();
  }
}

abstract class SendEmail implements EmailEvent {
  const factory SendEmail(
      {@required String email,
      @required String message,
      String phoneNumber,
      String name}) = _$SendEmail;

  @override
  String get email;
  @override
  String get message;
  @override
  String get phoneNumber;
  @override
  String get name;
  @override
  $SendEmailCopyWith<SendEmail> get copyWith;
}

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

  EmailLoaded emailLoaded({@required Email email}) {
    return EmailLoaded(
      email: email,
    );
  }
}

// ignore: unused_element
const $EmailState = _$EmailStateTearOff();

mixin _$EmailState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result sendingEmail(),
    @required Result failure(),
    @required Result emailLoaded(Email email),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result sendingEmail(),
    Result failure(),
    Result emailLoaded(Email email),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result sendingEmail(SendingEmail value),
    @required Result failure(Failure value),
    @required Result emailLoaded(EmailLoaded value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result sendingEmail(SendingEmail value),
    Result failure(Failure value),
    Result emailLoaded(EmailLoaded value),
    @required Result orElse(),
  });
}

abstract class $EmailStateCopyWith<$Res> {
  factory $EmailStateCopyWith(
          EmailState value, $Res Function(EmailState) then) =
      _$EmailStateCopyWithImpl<$Res>;
}

class _$EmailStateCopyWithImpl<$Res> implements $EmailStateCopyWith<$Res> {
  _$EmailStateCopyWithImpl(this._value, this._then);

  final EmailState _value;
  // ignore: unused_field
  final $Res Function(EmailState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result sendingEmail(),
    @required Result failure(),
    @required Result emailLoaded(Email email),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result sendingEmail(),
    Result failure(),
    Result emailLoaded(Email email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result sendingEmail(SendingEmail value),
    @required Result failure(Failure value),
    @required Result emailLoaded(EmailLoaded value),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result sendingEmail(SendingEmail value),
    Result failure(Failure value),
    Result emailLoaded(EmailLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements EmailState {
  const factory Initial() = _$Initial;
}

abstract class $SendingEmailCopyWith<$Res> {
  factory $SendingEmailCopyWith(
          SendingEmail value, $Res Function(SendingEmail) then) =
      _$SendingEmailCopyWithImpl<$Res>;
}

class _$SendingEmailCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $SendingEmailCopyWith<$Res> {
  _$SendingEmailCopyWithImpl(
      SendingEmail _value, $Res Function(SendingEmail) _then)
      : super(_value, (v) => _then(v as SendingEmail));

  @override
  SendingEmail get _value => super._value as SendingEmail;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result sendingEmail(),
    @required Result failure(),
    @required Result emailLoaded(Email email),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return sendingEmail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result sendingEmail(),
    Result failure(),
    Result emailLoaded(Email email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendingEmail != null) {
      return sendingEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result sendingEmail(SendingEmail value),
    @required Result failure(Failure value),
    @required Result emailLoaded(EmailLoaded value),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return sendingEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result sendingEmail(SendingEmail value),
    Result failure(Failure value),
    Result emailLoaded(EmailLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendingEmail != null) {
      return sendingEmail(this);
    }
    return orElse();
  }
}

abstract class SendingEmail implements EmailState {
  const factory SendingEmail() = _$SendingEmail;
}

abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

class _$FailureCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;
}

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
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result sendingEmail(),
    @required Result failure(),
    @required Result emailLoaded(Email email),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return failure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result sendingEmail(),
    Result failure(),
    Result emailLoaded(Email email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result sendingEmail(SendingEmail value),
    @required Result failure(Failure value),
    @required Result emailLoaded(EmailLoaded value),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result sendingEmail(SendingEmail value),
    Result failure(Failure value),
    Result emailLoaded(EmailLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements EmailState {
  const factory Failure() = _$Failure;
}

abstract class $EmailLoadedCopyWith<$Res> {
  factory $EmailLoadedCopyWith(
          EmailLoaded value, $Res Function(EmailLoaded) then) =
      _$EmailLoadedCopyWithImpl<$Res>;
  $Res call({Email email});
}

class _$EmailLoadedCopyWithImpl<$Res> extends _$EmailStateCopyWithImpl<$Res>
    implements $EmailLoadedCopyWith<$Res> {
  _$EmailLoadedCopyWithImpl(
      EmailLoaded _value, $Res Function(EmailLoaded) _then)
      : super(_value, (v) => _then(v as EmailLoaded));

  @override
  EmailLoaded get _value => super._value as EmailLoaded;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(EmailLoaded(
      email: email == freezed ? _value.email : email as Email,
    ));
  }
}

class _$EmailLoaded implements EmailLoaded {
  const _$EmailLoaded({@required this.email}) : assert(email != null);

  @override
  final Email email;

  @override
  String toString() {
    return 'EmailState.emailLoaded(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailLoaded &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $EmailLoadedCopyWith<EmailLoaded> get copyWith =>
      _$EmailLoadedCopyWithImpl<EmailLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result sendingEmail(),
    @required Result failure(),
    @required Result emailLoaded(Email email),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return emailLoaded(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result sendingEmail(),
    Result failure(),
    Result emailLoaded(Email email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailLoaded != null) {
      return emailLoaded(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result sendingEmail(SendingEmail value),
    @required Result failure(Failure value),
    @required Result emailLoaded(EmailLoaded value),
  }) {
    assert(initial != null);
    assert(sendingEmail != null);
    assert(failure != null);
    assert(emailLoaded != null);
    return emailLoaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result sendingEmail(SendingEmail value),
    Result failure(Failure value),
    Result emailLoaded(EmailLoaded value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailLoaded != null) {
      return emailLoaded(this);
    }
    return orElse();
  }
}

abstract class EmailLoaded implements EmailState {
  const factory EmailLoaded({@required Email email}) = _$EmailLoaded;

  Email get email;
  $EmailLoadedCopyWith<EmailLoaded> get copyWith;
}
