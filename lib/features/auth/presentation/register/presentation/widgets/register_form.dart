import 'dart:io';

import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/image_picker_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/helper_function/pick_image.dart';

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
  bool isPasswordVisible = true;
  bool isValid = false;
  File? imagePath;

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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: ImagePickerBottomSheet(
                      onCameraTap: () async {
                        Navigator.pop(context);

                        final image = await pickImage();

                        if (image != null) {
                          setState(() {
                            imagePath = image;
                          });
                        }
                      },
                      onGalleryTap: () async {
                        Navigator.pop(context);

                        final image =
                        await pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          setState(() {
                            imagePath = image;
                          });
                        }
                      },
                    ),
                  );
                },
              );
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffF9FAFA),
                    image: imagePath != null
                        ? DecorationImage(
                            image: FileImage(imagePath!),
                            fit: BoxFit.cover,
                          )
                        : null,
                    border: Border.all(color: Color(0xffE6E9EA)),
                    shape: BoxShape.circle,
                  ),
                  child: imagePath != null
                      ? null
                      : Icon(
                          Icons.add_a_photo_outlined,
                          size: 40,
                          color: AppColor.mainColor,
                        ),
                ),
                if (imagePath != null)
                  CircleAvatar(radius: 15, backgroundColor: Colors.white),
                if (imagePath != null)
                  CircleAvatar(
                    radius: 13.5,
                    backgroundColor: AppColor.mainColor,
                    child: Icon(Icons.edit, size: 15, color: Colors.white),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 25),
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
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return CustomButton(
                onPressed:
                    isTermsAndConditionsSelected && isValid && imagePath != null
                    ? () {
                    if (_formKey.currentState!.validate()) {
                      if (isTermsAndConditionsSelected == true) {
                        if(imagePath!=null){
                          BlocProvider.of<RegisterCubit>(context).register(
                            email: emailController.text,
                            password: passwordController.text,
                            userName: nameController.text,
                            imageFile: imagePath!,
                          );
                        }else{
                          AppVibration.heavy();
                          AppSounds.playClickSound('click_error.wav');

                          customShowSnakeBar(
                            context,
                            color: AppColor.red,
                            label: 'يرجى اختيار صورة الملف الشخصي',
                          );
                        }
                      } else {
                        AppVibration.heavy();
                        AppSounds.playClickSound('click_error.wav');

                        customShowSnakeBar(
                          context,
                          color: AppColor.red,
                          label: 'يرجى الموافقة على الشروط والأحكام للمتابعه',
                        );
                      }
                    }
                  }
                : null,
                child: state is! RegisterLoading
                    ? Text(
                        'إنشاء حساب جديد',
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    : CircularProgressIndicator(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}
