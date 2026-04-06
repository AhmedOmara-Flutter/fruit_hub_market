import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';

final instance = GetIt.instance;

void initAppModule() {
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  instance.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(instance()));
}