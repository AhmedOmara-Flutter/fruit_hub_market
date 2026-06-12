
import 'package:fruit_hub_market/features/reviews/presentation/view_model/review_cubit.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../../core/entities/product_entity.dart';

class RatingAndReviews extends StatefulWidget {
  const RatingAndReviews({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  State<RatingAndReviews> createState() => _RatingAndReviewsState();
}

class _RatingAndReviewsState extends State<RatingAndReviews> {
  @override
  void initState() {
    context.read<ReviewCubit>().getReviews(widget.product.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.start,
      children: [
        const Icon(Icons.star,
            color: Color(0xffFFC529)),
        const SizedBox(width: 5),
        Text("${context.watch<ReviewCubit>().averageRating}",style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Color(0xff111719)
        ),),
        const SizedBox(width: 5),
        Text(
          "(+${context.watch<ReviewCubit>().reviews.length})",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Color(0xff9796A1)
          ),),
        SizedBox(width: 10),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RouteManager.reviews,arguments: widget.product.id);
          },
          child: Text(
              "المراجعه",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColor.mainColor,
                decoration: TextDecoration.underline
              )
          ),
        ),
      ],
    );
  }
}
