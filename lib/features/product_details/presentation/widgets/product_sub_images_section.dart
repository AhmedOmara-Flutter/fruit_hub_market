import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../product/domain/entities/product_entity.dart';

class ProductSubImagesSection extends StatelessWidget {
  final ProductEntity product;
  const ProductSubImagesSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final images = product.subImages ?? [];
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) =>
            Container(
              margin: EdgeInsets.only(top: 15, right: 10),
              height: 100,
              width: 100,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),),),
            child:CachedNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  const Center(child: Skeletonizer(child: SizedBox(),)),
              errorWidget: (context, url, error) =>
                  Center(child: Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: Colors.grey.shade300,),
                  )),

            ),
            ),
        ),
      ),
    );
  }
}
