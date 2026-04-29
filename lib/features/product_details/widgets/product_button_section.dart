import '../../../core/utils/app_imports.dart';

class ProductButtonSection extends StatelessWidget {
  const ProductButtonSection({
    super.key,
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
          onPressed: () {},
        ),
      ),
    );
  }
}
