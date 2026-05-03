import 'package:fruit_hub_market/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

import '../../../core/utils/app_imports.dart';

class ProductButtonSection extends StatelessWidget {
  final ProductEntity product;

  const ProductButtonSection({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
   return SliverToBoxAdapter(
     child: Container(
       margin: EdgeInsets.only(
           bottom: 20
       ),
       child: CustomButton(
         child: Text(
           'أضف الي السله',
           style: Theme
               .of(context)
               .textTheme
               .labelSmall,
         ),
         onPressed: () {
           context.read<CartCubit>().addProduct(product);
         },
       ),
     ),
   );
  }
}
