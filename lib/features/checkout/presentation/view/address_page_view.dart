import '../../../../core/utils/app_imports.dart';

class AddressPageView extends StatelessWidget {
  const AddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20,
        children: [
          const SizedBox(height: 15),
          CustomTextFormField(
            hintText: 'الاسم كامل',
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
          ),
          CustomTextFormField(
            hintText: 'العنوان',
          ),
          CustomTextFormField(
            hintText: 'المدينه',
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه...',
          )
        ],
      ),
    );
  }
}
