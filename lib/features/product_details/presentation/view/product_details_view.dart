import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_details_view_body.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/app_imports.dart';

class ProductDetailsView extends StatelessWidget {
  final String productId;

  const ProductDetailsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(productId: productId,));
  }
}
