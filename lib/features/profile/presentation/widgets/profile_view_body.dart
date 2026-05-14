import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_generals_section.dart';
import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_header.dart';
import 'package:fruit_hub_market/features/profile/presentation/widgets/profile_help_section.dart';
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
              child: InfoActionRow(text: 'حسابي', bottomPadding: 0.0),
            ),
            SliverToBoxAdapter(child: ProfileHeader()),
            SliverToBoxAdapter(
              child: ProfileGeneralSection(),
            ),
            SliverToBoxAdapter(
              child: ProfileHelpSection(),
            ),
          ],
        ),
        ProfileInfoBanner(),
      ],
    );
  }
}


