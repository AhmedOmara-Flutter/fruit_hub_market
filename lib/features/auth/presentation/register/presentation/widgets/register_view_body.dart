import 'package:fruit_hub_market/core/utils/app_imports.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InfoActionRow(text: '',showBack: true,bottomPadding: 0,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                RegisterForm(),
                const SizedBox(height: 40),
                const CustomAuthFooter(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.mainColor),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColor.mainColor),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'يرجى التأكد من إدخال جميع البيانات المطلوبة، رفع الصورة، والموافقة على الشروط والأحكام لإتمام التسجيل.',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                              color: Color(0xff4E5556),
                              fontSize: 11
                          ),

                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
