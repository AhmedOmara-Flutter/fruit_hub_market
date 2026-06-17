import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_option_list.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileGeneralSection extends StatelessWidget {
  const ProfileGeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عام',
            style: Theme
                .of(
              context,
            )
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          ProfileOptionsList(
            text: 'الملف الشخصي',
            onTap: () {
              Navigator.pushNamed(context, RouteManager.editProfile);
            },
            image: Assets.images.user.path,
          ),
          ProfileOptionsList(
            text: 'طلباتي',
            onTap: () {
              Navigator.pushNamed(context, RouteManager.orders);
            },
            image: Assets.images.box.path,
          ),
          ProfileOptionsList(
            text: 'المفضلة',
            onTap: () {
              Navigator.pushNamed(context, RouteManager.favorite);
            },
            image: Assets.images.heart.path,
          ),
          // ProfileOptionsList(
          //   text: 'الإشعارات',
          //   isButton: true,
          //   image: Assets.images.notification.path,
          // ),
          // ProfileOptionsList(
          //   text: 'اللغة',
          //   onTap: () {},
          //   image: Assets.images.global.path,
          // ),
        ],
      ),
    );
  }
}
