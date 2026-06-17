import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/features/reviews/presentation/widgets/EmptyReviewWidget.dart';
import 'package:fruit_hub_market/features/reviews/presentation/widgets/rating_breakdown_section.dart';
import 'package:fruit_hub_market/features/reviews/presentation/widgets/review_item.dart';
import '../../../../core/utils/app_imports.dart';
import '../../domain/entities/review_entity.dart';
import '../view_model/review_cubit.dart';
import 'review_bar_section.dart';
import 'review_field_section.dart';

class ReviewsViewBody extends StatelessWidget {
  final String productId;

  const ReviewsViewBody({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        var cubit = context.read<ReviewCubit>();
        return Form(
          key: cubit.formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: InfoActionRow(text: 'المراجعه', showBack: true),
              ),
              CustomReviewFieldSection(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: cubit.reviewController,
              ),
              CustomReviewBarSection(
                initialRate: cubit.rate,
                ratingUpdate: (double p1) {
                  cubit.updateRatingField(p1);
                },
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  onPressed: () {
                    final textValid = cubit.reviewController.text
                        .trim()
                        .isNotEmpty;
                    final ratingValid = cubit.rate != 0;

                    if (textValid && ratingValid) {
                      cubit.addReview(
                        ReviewEntity(
                          image: getUser().image,
                          date: DateTime.now().toString(),
                          reviewDescription: cubit.reviewController.text,
                          rating: cubit.rate,
                          name: getUser().userName,
                        ),
                        productId,
                      );
                    } else {
                      customShowSnakeBar(
                        context,
                        color: Colors.red,
                        label: 'برجاء كتابة تعليق وتقييم المنتج',
                      );
                    }
                  },
                  child: Text(
                    'اضافه تعليق',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
              RatingBreakdownSection(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 20),
                  child: Text(
                    'التعليقات',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
                  )),
              ),
              ConditionalBuilder(
                condition: cubit.reviews.isNotEmpty,
                builder: (context) => SliverList.separated(
                  itemBuilder: (context, index) =>
                      ReviewItem(review: cubit.reviews[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: cubit.reviews.length,
                ),
                fallback: (context) => EmptyReviewWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
