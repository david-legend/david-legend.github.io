import 'package:aerium/infrastructure/bloc/email_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'infrastructure/api/email_api.dart';
import 'infrastructure/api/email_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => EmailBloc(getIt()));
  getIt.registerLazySingleton<EmailRepository>(() => EmailRepositoryImpl(emailApi: getIt()));
  getIt.registerLazySingleton<EmailApi>(() => EmailApiImpl(client: getIt()));
  getIt.registerLazySingleton(() => http.Client());

}