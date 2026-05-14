import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/product_details/presentation/widgets/reviews_view_body.dart';

import '../view_model/product_details_cubit.dart';

class ReviewsView extends StatelessWidget {
  final String productId;

  const ReviewsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(instance())..getReviews(productId),
        child: ReviewsViewBody(productId: productId,),
      ),
    );
  }
}

