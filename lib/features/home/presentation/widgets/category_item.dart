import 'package:fruit_hub_market/core/entities/product_entity.dart';

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
          arguments: productEntity.id,
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: size / 1.9,
            backgroundColor: Colors.grey.withOpacity(0.1),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: (size / 1.90) - 2,
              backgroundImage: NetworkImage(
                productEntity.image ?? '',
              ),
            ),
          ),
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
