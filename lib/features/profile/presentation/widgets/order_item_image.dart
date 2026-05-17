import '../../../../core/utils/app_imports.dart';

class OrderItemImage extends StatelessWidget {
  const OrderItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEBF9F1),
      ),
      child: SvgPicture.asset(Assets.images.package.path),
    );
  }
}
