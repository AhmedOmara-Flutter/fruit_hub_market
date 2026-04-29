import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../features/product/domain/entities/product_entity.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;

  const FruitItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.productDetails, arguments: product);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ),
            Positioned.fill(
              top: 25,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Flexible(
                    child: Image.network(
                      product.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    dense: true,
                    title: Text(
                      product.name,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${product.price}جنية / ',
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: Color(0xffF4A91F)),
                          ),
                          TextSpan(
                            text: 'كيلو',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: Color(0xffF4A91F)),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color(0xff1B5E37),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
