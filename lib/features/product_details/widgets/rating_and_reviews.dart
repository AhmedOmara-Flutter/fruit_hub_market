import '../../../core/utils/app_imports.dart';
import '../../product/domain/entities/product_entity.dart';

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.start,
      children: [
        const Icon(Icons.star,
            color: Color(0xffFFC529)),
        const SizedBox(width: 5),
        Text("${product.avgRating}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Color(0xff111719)
        ),),
        const SizedBox(width: 5),
        Text(
          "(+30)",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Color(0xff9796A1)
          ),),
        SizedBox(width: 10),
        Text(
            "المراجعه",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: const Color(0xff1B5E37),
              decoration: TextDecoration.underline
            )
        ),
      ],
    );
  }
}
