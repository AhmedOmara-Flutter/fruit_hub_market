import '../../../../core/utils/app_imports.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Row(
        children: [
          Text(
            'منتجاتنا',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
