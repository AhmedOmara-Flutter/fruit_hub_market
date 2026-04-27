import 'package:fruit_hub_market/features/main/presentation/view/pages/products/widgets/product_view_body.dart';
import '../../../../../../../core/utils/app_imports.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(MainRepoImpl(FirestoreDatabase())),
      child: ProductViewBody(),
    );
  }
}
