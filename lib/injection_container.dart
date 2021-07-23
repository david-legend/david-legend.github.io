import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:aerium/application/email/email_bloc.dart';
import 'package:aerium/infrastructure/email/email_api.dart';

import 'infrastructure/email/email_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => EmailBloc(
      sl(),
    ),
  );

  //Repositories
  sl.registerLazySingleton<EmailRepository>(
    () => EmailRepositoryImpl(
      emailApi: sl(),
    ),
  );

  //Apis
  sl.registerLazySingleton<EmailApi>(
    () => EmailApiImpl(client: sl()),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());
}
