import 'package:fruit_hub_market/core/utils/app_imports.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is SignInWithGoogleError){
          customShowSnakeBar(context, color: Colors.red, label: state.errMessage);
        }
        if(state is SignInWithFacebookError){
          customShowSnakeBar(context, color: Colors.red, label: state.errMessage);
        }

      },
      builder: (context, state) {
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
              onPressed: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
            ),
            CustomSocialButton(
              text: "تسجيل بواسطة أبل",
              image: Assets.images.apple.path,
              onPressed: () {},
            ),
            CustomSocialButton(
              text: "تسجيل بواسطة فيسبوك",
              image: Assets.images.facebook.path,
              onPressed: () {
                context.read<LoginCubit>().signInWithFacebook();
              },
            )
          ],
        );
      },
    );
  }
}
