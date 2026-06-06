import '../../../../core/utils/app_imports.dart';

class EmptyReviewWidget extends StatelessWidget {
  const EmptyReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: MediaQuery
              .sizeOf(context)
              .height * 0.1),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.25,
            child: Image.asset(Assets.images.emptyReview.path),
          ),
          const SizedBox(height: 10),
          Text(
            'لا توجد مراجعات حتى الآن',
            style: Theme
                .of(
              context,
            )
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
          ),

          const SizedBox(height: 6),

          Text(
            'كن أول من يشارك رأيه عن هذا المنتج',
            style: Theme
                .of(
              context,
            )
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
