import 'package:fruit_hub_market/core/services/storage_services.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/checkout/domain/repos/checkout_repo.dart';
import 'package:fruit_hub_market/features/product/data/repos/product_repo_impl.dart';
import 'package:fruit_hub_market/features/product/domain/repos/product_repo.dart';

import '../../features/checkout/data/repos/checkout_repo_impl.dart';
import '../../features/favorite/app/repos/favorite_repo_impl.dart';
import '../../features/favorite/domain/repos/favorite_repo.dart';
import '../../features/reviews/data/repos/review_repo_impl.dart';
import '../../features/reviews/domain/repos/review_repo.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/profile/domain/repos/profile_repo.dart';

final instance = GetIt.instance;

void initAppModule() {
  instance.registerLazySingleton<AuthServices>(
        () => AuthWithFirebase(),
  );
  instance.registerLazySingleton<DatabaseServices>(() => FirestoreDatabase());
  instance.registerLazySingleton<StorageServices>(() => SupabaseStorage());
  instance.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(instance(), instance(), instance()),
  );

  instance.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(instance()),
  );

  instance.registerLazySingleton<FavoriteRepo>(
    () => FavoriteRepoImpl(instance()),
  );
  instance.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(instance()),
  );

  instance.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(instance()),
  );
  instance.registerLazySingleton<ReviewRepo>(
        () => ReviewRepoImpl(instance()),
  );
}
