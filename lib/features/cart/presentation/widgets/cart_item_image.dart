
import '../../../../core/utils/app_imports.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key});

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
        child: Image.asset(Assets.images.strawberry.path, fit: BoxFit.contain),
      ),
    );
  }
}
