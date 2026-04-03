import '../../../../../core/utils/app_imports.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          // Email
          TextFormField(
            decoration: InputDecoration(hintText: "البريد الإلكتروني"),
          ),
          const SizedBox(height: 15),
          // Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "كلمة المرور",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Forgot password
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "نسيت كلمة المرور؟",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Color(0xff2D9F5D)),
            ),
          ),
          const SizedBox(height: 40),
          // Login Button
          CustomButton(label: 'تسجيل دخول', onPressed: () {}),
          const SizedBox(height: 40),
          // Register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "لا تمتلك حساب؟ ",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Color(0xff949D9E)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.register);
                },
                child: Text(
                  "قم بإنشاء حساب",
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: Color(0xff1B5E37)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // Divider with OR
          Row(
            children: [
              Expanded(child: Divider(color: Color(0xffDDDFDF))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "أو",
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
              ),
              Expanded(child: Divider(color: Color(0xffDDDFDF))),
            ],
          ),
          const SizedBox(height: 30),
          // Social Buttons
          socialButton("تسجيل بواسطة جوجل", Assets.images.google.path, context),
          socialButton("تسجيل بواسطة أبل", Assets.images.apple.path, context),
          socialButton(
            "تسجيل بواسطة فيسبوك",
            Assets.images.facebook.path,
            context,
          ),
        ],
      ),
    );
  }
}

Widget socialButton(String text, String image, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: OutlinedButton(
      onPressed: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(image, width: 20, height: 20),
          ),
          Text(text, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    ),
  );
}
