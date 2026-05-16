import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/app_imports.dart';

class CartItemImage extends StatelessWidget {
  final String image;

  const CartItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.23,
      height: width * 0.33,
      decoration: BoxDecoration(
        color: Color(0xffF3F5F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          placeholder: (context, url) =>
              const Center(child: Skeletonizer(child: SizedBox())),
          errorWidget: (context, url, error) =>
              Center(child: Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Colors.grey.shade300,),
              )),
        ),
      ),
    );
  }
}
