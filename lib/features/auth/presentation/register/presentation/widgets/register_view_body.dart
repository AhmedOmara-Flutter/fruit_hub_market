import 'package:fruit_hub_market/features/auth/data/repos/auth_repo_impl.dart';

import '../../../../../../core/utils/app_imports.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          // full name
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(hintText: "الاسم كامل"),
          ),
          const SizedBox(height: 15),
          // email
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "البريد الإلكتروني"),
          ),
          const SizedBox(height: 15),
          // Password
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
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
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color(0xffDDDFDF)
                      )
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: ' من خلال إنشاء حساب ، فإنك توافق على',
                      style: Theme
                          .of(context,)
                          .textTheme
                          .titleMedium,
                      children: [
                        TextSpan(
                            text: ' الشروط \nوالأحكام الخاصة بنا'
                            , style: Theme
                            .of(context,)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Color(0xff2D9F5D)
                        )
                        )
                      ]
                  ),

                ),
              ]
          ),
          const SizedBox(height: 40),
          CustomButton(label: 'إنشاء حساب جديد', onPressed: () {
            AuthRepoImpl(authRemoteDataSource: AuthRemoteDataSourceImpl())
                .createUserWithEmailAndPassword(
                RegisterRequest(
                    email: emailController.text,
                    password: passwordController.text
                ));
          }),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تمتلك حساب بالفعل؟ ",
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Color(0xff949D9E)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteManager.login);
                },
                child: Text(
                  'تسجيل دخول',
                  style: Theme
                      .of(
                    context,
                  )
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Color(0xff1B5E37)),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
