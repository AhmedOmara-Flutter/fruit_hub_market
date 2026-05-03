import 'package:fruit_hub_market/features/product_details/widgets/custom_review_field.dart';
import 'package:fruit_hub_market/features/product_details/widgets/rating_bar_item.dart';
import 'package:fruit_hub_market/features/product_details/widgets/review_item.dart';

import '../../../core/utils/app_imports.dart';
import '../../product/domain/entities/review_entity.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: InfoActionRow(text: 'المراجعه', isBack: true)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomReviewField(),
                const SizedBox(height: 15),
                Text(
                  "324 مراجعه",
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
                // Rating Section
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
            review: ReviewEntity(
              name: "Ahmed Omara",
              image: '',
              date: '25/06/2020',
              reviewDescription:
              "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيُشتت القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات",
              rating: 4.0,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: 5,
        ),
      ],
    );
  }
}

