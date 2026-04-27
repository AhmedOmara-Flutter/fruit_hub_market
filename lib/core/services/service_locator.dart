import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/product/data/repos/product_repo_impl.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';


final instance = GetIt.instance;

void initAppModule() {
  instance.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  instance.registerLazySingleton<DatabaseServices>(
    () => FirestoreDatabase(),
  );

  instance.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(instance(),instance()));

  instance.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(instance()));
}


