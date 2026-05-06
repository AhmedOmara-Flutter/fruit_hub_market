import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/utils/app_imports.dart';
import '../../domain/entities/review_entity.dart';
class ReviewItem extends StatelessWidget {
  final ReviewEntity review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: review.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Skeletonizer(child: Container(
                        ),),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: Colors.red),
                  ),),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 15,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(5),
                    color: Color(0xffFFC529),
                  ),
                  child: Text(
                    review.rating.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    review.date,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 8),
                  Text(
                    review.reviewDescription,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
