import 'package:fruit_hub_market/features/auth/presentation/login/presentation/widgets/custom_social_button.dart';
import '../../../../../../core/utils/app_imports.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Color(0xffDDDFDF))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "أو",
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!,
              ),
            ),
            Expanded(child: Divider(color: Color(0xffDDDFDF))),
          ],
        ),
        const SizedBox(height: 30),
        CustomSocialButton(
          text: "تسجيل بواسطة جوجل",
          image: Assets.images.google.path,
        ),
        CustomSocialButton(
          text: "تسجيل بواسطة أبل",
          image: Assets.images.apple.path,
        ),
        CustomSocialButton(
          text: "تسجيل بواسطة فيسبوك",
          image: Assets.images.facebook.path,
        )
      ],
    );
  }
}
