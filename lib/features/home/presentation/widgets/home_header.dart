import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../../checkout/presentation/view_model/checkout_cubit.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 20),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: getUser().image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                    width: 80,
                    height: 80,
                 color: AppColor.red,
                  ),),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColor.red),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'صباح الخير !..',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Color(0xff949D9E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                getUser().userName,
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Color(0xff0C0D0D)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
