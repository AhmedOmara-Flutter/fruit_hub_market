import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/custom_auth_footer.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/custom_password_field.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/custom_terms_and_conditions.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/custom_text_form_field.dart';
import '../../../../../../core/utils/app_imports.dart';
import '../view_model/register_cubit.dart';

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              hintText: 'الاسم كامل',
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'البريد الإلكتروني',
            ),
            const SizedBox(height: 15),
            CustomPasswordField(controller: passwordController),
            const SizedBox(height: 15),
            CustomTermsAndConditions(),
            const SizedBox(height: 40),
            CustomButton(label: 'إنشاء حساب جديد', onPressed: () {
              BlocProvider.of<RegisterCubit>(context).register(
                  email: emailController.text,
                  password: passwordController.text,
                  userName: nameController.text);
            }),
            const SizedBox(height: 40),
            const CustomAuthFooter(),
          ],
        ),
      ),
    );
  }
}
