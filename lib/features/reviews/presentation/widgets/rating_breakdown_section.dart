import 'package:fruit_hub_market/features/reviews/presentation/widgets/rating_bar_item.dart';
import '../../../../core/utils/app_imports.dart';
import '../view_model/get_review_cubit/get_review_cubit.dart';

class RatingBreakdownSection extends StatelessWidget {
  const RatingBreakdownSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetReviewCubit>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          "${cubit.averageRating}",
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "${cubit.recommendedPercentage}%",
                      style: Theme.of(context).textTheme.titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "موصى بها",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children:  [
                      RatingBarItem(star: 5, value:cubit.getPercentage(5)),
                      RatingBarItem(star: 4, value:cubit.getPercentage(4)),
                      RatingBarItem(star: 3, value:cubit.getPercentage(3)),
                      RatingBarItem(star: 2, value:cubit.getPercentage(2)),
                      RatingBarItem(star: 1, value:cubit.getPercentage(1)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
