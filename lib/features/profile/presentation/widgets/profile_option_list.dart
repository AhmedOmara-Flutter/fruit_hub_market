import 'package:fruit_hub_market/features/profile/presentation/widgets/toggle_button.dart';

import '../../../../core/utils/app_imports.dart';

class ProfileOptionsList extends StatelessWidget {
  final bool isButton;
  final String text;
  final String image;
  final void Function()? onTap;

  const ProfileOptionsList({
    super.key,
    this.isButton = false,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                SvgPicture.asset(image, color: Color(0xff1B5E37)),
                SizedBox(width: 10),
                Text(
                  text,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Color(0xff949D9E)),
                ),
                Spacer(),
                isButton
                    ? ToggleButton()
                    : Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
            Divider(height: 2),
          ],
        ),
      ),
    );
  }
}
