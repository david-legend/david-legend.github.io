import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:aerium/infrastructure/email/email_model.dart';
import 'package:aerium/infrastructure/email/email_repository.dart';

part 'email_event.dart';

part 'email_state.dart';

part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailBloc(this._emailRepository);

  @override
  EmailState get initialState => EmailState.initial();

  @override
  Stream<EmailState> mapEventToState(
    EmailEvent event,
  ) async* {
    if (event is EmailEvent) {
      yield EmailState.sendingEmail();
      final response = await _emailRepository.sendEmail(
        email: event.email,
        message: event.message,
        phoneNumber: event.phoneNumber,
        name: event.name,
      );

      yield* response.fold(
        (failure) async* {
          yield EmailState.failure();
        },
        (data) async* {
          yield EmailState.emailLoaded(email: data);
        },
      );
    }
  }
}
