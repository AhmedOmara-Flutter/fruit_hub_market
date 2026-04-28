import '../../../../core/utils/app_imports.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        children: [
          Text(
            'منتجاتنا',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border:Border.all(color: Color(0xffEAEBEB))
            ),
            child: SvgPicture.asset(Assets.images.filter2.path),


          )
        ],
      ),
    );
  }
}
