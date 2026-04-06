import 'package:fruit_hub_market/core/utils/app_imports.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isTermsAndConditionsSelected = false;
  bool isPasswordVisible = false;
  bool isFormValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل اسمك الكامل';
              }
              if (value.trim().length < 3) {
                return 'الاسم يجب أن يكون 3 أحرف على الأقل';
              }
              return null;
            },
            controller: nameController,
            keyboardType: TextInputType.name,
            hintText: 'الاسم كامل',
          ),
          const SizedBox(height: 15),
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
            obscureText:isPasswordVisible ,
            onSuffixTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          const SizedBox(height: 15),
          CustomTermsAndConditions(
            isTermsAndConditionsSelected: isTermsAndConditionsSelected,
            onTap: () {
              setState(() {
                isTermsAndConditionsSelected = !isTermsAndConditionsSelected;
              });
            },
          ),
          const SizedBox(height: 40),
          CustomButton(
            label: 'إنشاء حساب جديد',
            onPressed: isTermsAndConditionsSelected && isFormValid()
                ? () {
                    if (_formKey.currentState!.validate()) {
                      if (isTermsAndConditionsSelected == true) {
                        BlocProvider.of<RegisterCubit>(context).register(
                          email: emailController.text,
                          password: passwordController.text,
                          userName: nameController.text,
                        );
                      } else {
                        customShowSnakeBar(
                          context,
                          color: Colors.red,
                          label: 'يرجى الموافقة على الشروط والأحكام للمتابعه',
                        );
                      }
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
