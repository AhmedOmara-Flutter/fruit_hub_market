import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_header.dart';
import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_info_banner.dart';
import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_option_list.dart';

import '../../../../core/utils/app_imports.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  InfoActionRow(text: 'حسابي', bottomPadding: 0.0),
                  ProfileHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'عام',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        ProfileOptionsList(
                          text: 'الملف الشخصي',
                          onTap: () {
                          },
                          image: Assets.images.user.path,
                        ),
                        ProfileOptionsList(
                          text: 'طلباتي',
                          onTap: () {},
                          image: Assets.images.box.path,
                        ),
                        ProfileOptionsList(
                          text: 'المدفوعات',
                          onTap: () {},
                          image: Assets.images.emptyWallet.path,
                        ),
                        ProfileOptionsList(
                          text: 'المفضلة',
                          onTap: () {},
                          image: Assets.images.heart.path,
                        ),
                        ProfileOptionsList(
                          text: 'الإشعارات',
                          isButton: true,
                          image: Assets.images.notification.path,
                        ),
                        ProfileOptionsList(
                          text: 'اللغة',
                          onTap: () {},
                          image: Assets.images.global.path,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'المساعدة',
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        ProfileOptionsList(
                          text: 'من نحن',
                          onTap: () {},
                          image: Assets.images.global.path,
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ProfileInfoBanner(),
      ],
    );
  }
}
