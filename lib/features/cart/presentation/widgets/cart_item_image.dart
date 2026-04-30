
import '../../../../core/utils/app_imports.dart';

class CartItemImage extends StatelessWidget {
  final String image;

  const CartItemImage({super.key, required this.image,});

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
        child: Image.network(image, fit: BoxFit.contain),
      ),
    );
  }
}
