import 'package:fruit_hub_market/features/offers/presentation/view_model/offer_cubit.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_button_section.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_details_section.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_image_section.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_info_grid_section.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/product_sub_images_section.dart';
import '../../../../core/utils/app_imports.dart';
import '../../../../core/entities/product_entity.dart';


class ProductDetailsViewBody extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsViewBody({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {
    final offer = context.watch<OfferCubit>().offersMap[product.id];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductImageSection(product: product,offer: offer),
         ProductSubImagesSection(product: product,),
          ProductDetailsSection(product: product,  offer: offer,),
          ProductInfoGridSection(product: product,offer: offer),
          ProductButtonSection(product: product,offer: offer,),
        ],
      ),
    );
  }
}



