import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/rating_bar_item.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/review_item.dart';

import '../../../../core/utils/app_imports.dart';
import '../../domain/entities/review_entity.dart';
import '../view_model/product_details_cubit.dart';
import 'custom_review_field.dart';

class ReviewsViewBody extends StatelessWidget {
  final String productId;

  const ReviewsViewBody({super.key, required this.productId,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(instance())..getReviews(productId),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<ProductDetailsCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: InfoActionRow(text: 'المراجعه', isBack: true)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomReviewField(
                  controller: cubit.reviewController,
                  onPressed: () {
                    cubit.addReview(ReviewEntity(
                        image: '',
                        date: DateTime.now().toString(),
                        reviewDescription: cubit.reviewController.text,
                        rating: 4.2,
                        name: getUser().userName
                    ), productId);
                    cubit.reviewController.clear();
                  },),
                const SizedBox(height: 15),
                Text(
                  "${cubit.reviews.length} مراجعه",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'الملخص',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Text(
                              "4.5",
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "88%",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "موصى بها",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: const [
                          RatingBarItem(star: 5, value: 0.9),
                          RatingBarItem(star: 4, value: 0.75),
                          RatingBarItem(star: 3, value: 0.55),
                          RatingBarItem(star: 2, value: 0.35),
                          RatingBarItem(star: 1, value: 0.15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) =>  ReviewItem(
            review: cubit.reviews[index],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: cubit.reviews.length,
        ),
      ],
    );
        },
      ),
    );
  }
}

