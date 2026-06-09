import '../../../../core/utils/app_imports.dart';

class SkeletonizerCategoryItem extends StatelessWidget {
  const SkeletonizerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.2;
    return Skeletonizer(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            CircleAvatar(
              radius: size / 2,
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: (size / 2) - 2,
                backgroundImage: AssetImage(Assets.images.emptyCart.path),
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   child: Container(
            //     height: 90,
            //     width: 90,
            //     clipBehavior: Clip.antiAliasWithSaveLayer,
            //     decoration: BoxDecoration(
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(
            //           color: Colors.grey.withOpacity(0.1),
            //         )
            //     ),
            //     child: Image.network(
            //       productEntity.image ?? '',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              'nameee',
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Color(0xff0C0D0D)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
