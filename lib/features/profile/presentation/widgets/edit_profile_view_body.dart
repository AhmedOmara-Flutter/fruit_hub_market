import 'package:fruit_hub_market/core/helper_function/custom_show_dialog.dart';
import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/features/profile/presentation/view_model/profile_cubit.dart';

import '../../../../core/utils/app_imports.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode;

  @override
  void initState() {
    super.initState();
    nameController.text = getUser().userName;
    phoneController.text = getUser().phone;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoActionRow(text: 'الملف الشخصي', isBack: true),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'المعلومات الشخصيه',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.black),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: nameController,
                  suffixIcon: Icons.edit,
                  onSuffixPressed: () {},
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: phoneController,
                  suffixIcon: Icons.edit,
                  onSuffixPressed: () {},
                ),
                SizedBox(height: 30),
                Text(
                  'تغيير كلمة المرور',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.black),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'كلمة المرور الحالي',
                  suffixIcon: Icons.remove_red_eye,
                  onSuffixPressed: () {},
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'كلمة المرور الجديده',
                  suffixIcon: Icons.remove_red_eye,
                  onSuffixPressed: () {},
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'تأكيد كلمة المرور الجديده',
                  suffixIcon: Icons.remove_red_eye,
                  onSuffixPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          CustomButton(
            onPressed: () {},
            child: Text(
              'حفظ التغييرات',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          SizedBox(height: 10),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileDeleteAccountSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  RouteManager.onBoarding,
                );
                context.read<MainCubit>().currentIndex=0;
              }
            },
            child: CustomButton(
              color: Colors.red,
              onPressed: () {
                cubit.resetState();

                customShowDialog(
                  context,
                  title: 'تأكيد حذف الحساب',
                  content: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final cubit = context.read<ProfileCubit>();

                      bool isError = state is ProfileDeleteAccountError;
                      String? errorMessage = isError ? state.errMessage : null;

                      return Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('اكتب كلمة المرور للتأكيد'),
                            const SizedBox(height: 10),
                            //focus on it
                            if (isError) ...[
                              Row(
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      errorMessage!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                            CustomPasswordField(
                              controller: passwordController,
                              obscureText: cubit.obscureText,
                              validator: (value) {
                                if (value!.trim().length < 6) {
                                  return 'كلمة المرور يجب ألا تقل عن 6 أحرف';
                                }
                                if (value.isEmpty) {
                                  return 'برجاء ادخال كلمه المرور';
                                }
                                return null;
                              },
                              onSuffixTap: () {
                                cubit.changeObscureText();
                              },
                              onChange: (value){
                                cubit.clearError();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  accept: () async {
                    if (formKey.currentState!.validate()) {
                      await cubit.deleteAccount(passwordController.text);
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  cancel: () {
                    Navigator.pop(context);
                  },
                );
              },
              child: Text(
                'حذف الحساب',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
