import 'package:fruit_hub_market/features/product_details/widgets/product_button_section.dart';
import 'package:fruit_hub_market/features/product_details/widgets/product_details_section.dart';
import 'package:fruit_hub_market/features/product_details/widgets/product_image_section.dart';
import 'package:fruit_hub_market/features/product_details/widgets/product_info_grid_section.dart';

import '../../../core/utils/app_imports.dart';
import '../../product/domain/entities/product_entity.dart';

class ProductDetailsViewBody extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsViewBody({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductImageSection(product: product,),
          ProductDetailsSection(product: product),
          ProductInfoGridSection(product: product,),
          ProductButtonSection(),
        ],
      ),
    );
  }


}






