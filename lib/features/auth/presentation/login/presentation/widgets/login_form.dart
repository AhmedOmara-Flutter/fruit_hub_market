import 'package:fruit_hub_market/core/utils/app_imports.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        setState(() {
          isValid = _formKey.currentState?.validate() ?? false;
        });
      },
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل البريد الإلكتروني';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'من فضلك أدخل بريد إلكتروني صحيح';
              }
              return null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'البريد الإلكتروني',
          ),
          const SizedBox(height: 15),
          CustomPasswordField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل كلمة المرور';
              }
              if (value.length < 6) {
                return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
              }
              return null;
            },
            controller: passwordController,
            obscureText: isPasswordVisible,
            onSuffixTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteManager.forgetPassword);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "نسيت كلمة المرور؟",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Color(0xff2D9F5D)),
              ),
            ),
          ),
          const SizedBox(height: 40),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomButton(
                onPressed: isValid
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    : null,
                child: state is !LoginLoading? Text(
                  'تسجيل دخول',
                  style: Theme.of(context).textTheme.labelSmall,
                ):CircularProgressIndicator(color: Colors.white,),
              );
            },
          ),
        ],
      ),
    );
  }
}
