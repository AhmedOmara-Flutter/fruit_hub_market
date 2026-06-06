import '../../../../core/utils/app_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CustomReviewBarSection extends StatelessWidget {
  final  void Function(double) ratingUpdate;
  final double initialRate;
  const CustomReviewBarSection({super.key, required this.ratingUpdate, required this.initialRate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 20),
          child: RatingBar.builder(
            initialRating:initialRate,
            minRating: 1,
            direction:  Axis.horizontal,
            unratedColor: Colors.amber.withAlpha(80),
            itemCount: 5,
            itemSize: 40.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
            itemBuilder: (context, _) => Icon(
             Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: ratingUpdate,
            updateOnDrag: true,
          ),
        ),
      ],
    );
  }
}
