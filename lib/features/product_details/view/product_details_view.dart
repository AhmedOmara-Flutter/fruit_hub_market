import 'package:fruit_hub_market/features/product_details/widgets/product_details_view_body.dart';

import '../../../core/utils/app_imports.dart';
import '../../product/domain/entities/product_entity.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(product: product,));
  }
}
