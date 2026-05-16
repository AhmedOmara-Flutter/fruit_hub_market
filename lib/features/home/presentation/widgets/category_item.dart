import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

import '../../../../core/utils/app_imports.dart';

class CategoryItem extends StatelessWidget {
  final ProductEntity productEntity;
  const CategoryItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.2;
    return GestureDetector(
      onTap: () async {
        await AppSounds.playClickSound('click_song.wav');
        Navigator.pushNamed(
          context,
          RouteManager.productDetails,
          arguments: productEntity,
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: size / 2,
            backgroundColor: Colors.grey.withOpacity(0.1),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: (size / 2) - 2,
              backgroundImage: NetworkImage(
                productEntity.image ?? '',
              ),
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
            productEntity.name,
            style: Theme
                .of(
              context,
            )
                .textTheme
                .titleMedium!
                .copyWith(color: Color(0xff0C0D0D)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
