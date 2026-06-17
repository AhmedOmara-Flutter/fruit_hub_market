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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode;

  @override
  void initState() {
    super.initState();
    nameController.text = getUser().userName;
    phoneController.text = getUser().phone;
    emailController.text = getUser().email;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoActionRow(text: 'الملف الشخصي', showBack: true),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: nameController,
                  prefixIcon: Icons.person,
                  label: 'الاسم',
                  readOnly: true,
      
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: phoneController,
                  prefixIcon: Icons.phone,
                  label: 'رقم التليفون',
                  readOnly: true,
      
      
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: emailController,
                  prefixIcon: Icons.email,
                  label: 'الايميل',
                  readOnly: true,


                ),
                SizedBox(height: 30),
              ],
            ),
          ),

          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileDeleteAccountSuccess) {
                Navigator.pushReplacementNamed(
                  context,
                  RouteManager.onBoarding,
                );
                context
                    .read<MainCubit>()
                    .currentIndex = 0;
              }
            },

            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    cubit.resetState();

                    CustomShowDialog.show(
                      flag: Icons.delete_forever,
                      color: Colors.red,
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
                                Text(
                                  'اكتب كلمة المرور للتأكيد',
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(
                                    context,
                                  )
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),),
                                const SizedBox(height: 10),
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
                                  onChange: (value) {
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
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          'حذف الحساب',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
