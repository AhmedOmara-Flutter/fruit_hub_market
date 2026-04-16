import 'package:fruit_hub_market/core/utils/app_imports.dart';


final instance = GetIt.instance;

void initAppModule() {
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  instance.registerLazySingleton<DatabaseServices>(
    () => FirestoreDatabase(),
  );

  instance.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(instance(),instance()));
}