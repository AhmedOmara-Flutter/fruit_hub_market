import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/reviews/presentation/widgets/reviews_view_body.dart';
import '../view_model/review_cubit.dart';

class ReviewsView extends StatelessWidget {
  final String productId;

  const ReviewsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        ReviewCubit(instance())
          ..getReviews(productId),
        child: BlocListener<ReviewCubit, ReviewState>(
          listener: (context, state) {
            if (state is AddReviewError) {
              customShowSnakeBar(
                context,
                color: Colors.red,
                label: state.errMessage,
              );
            }
            if (state is AddReviewSuccess) {
              customShowSnakeBar(
                  context,
                  color:AppColor.mainColor,
                  label:'شكراً ليك! تم إضافة تعليقك بنجاح 👌'
              );
              context.read<ReviewCubit>().reviewController.clear();
              context.read<ReviewCubit>().rate=0;

            }
          },
          child: ReviewsViewBody(productId: productId,),
        ),
      ),
    );
  }
}

