import '../../../../core/utils/app_imports.dart';

class AddressFormSection extends StatelessWidget {
  const AddressFormSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.countryController,
    required this.apartmentController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController countryController;
  final TextEditingController apartmentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          hintText: 'الاسم كامل',
          validator: (value) {
            if (value == null || value
                .trim()
                .isEmpty) {
              return 'من فضلك أدخل الاسم كامل';
            }
            if (value
                .trim()
                .length < 3) {
              return 'الاسم قصير جدًا';
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          controller: emailController,
          hintText: 'البريد الإلكتروني',
          validator: (value) {
            if (value == null || value
                .trim()
                .isEmpty) {
              return 'من فضلك أدخل البريد الإلكتروني';
            }

            // final emailRegex = RegExp(
            //   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            // );
            //
            // if (!emailRegex.hasMatch(value.trim())) {
            //   return 'البريد الإلكتروني غير صحيح';
            // }

            return null;
          },

        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          controller: addressController,
          hintText: 'العنوان',
          validator: (value) {
            if (value == null || value
                .trim()
                .isEmpty) {
              return 'من فضلك أدخل العنوان';
            }
            return null;
          },

        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          controller: countryController,
          hintText: 'المدينه',
          validator: (value) {
            if (value == null || value
                .trim()
                .isEmpty) {
              return 'من فضلك أدخل المدينة';
            }
            return null;
          },

        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          controller: apartmentController,
          hintText: 'رقم الطابق , رقم الشقه...',
          validator: (value) {
            if (value == null || value
                .trim()
                .isEmpty) {
              return 'من فضلك أدخل تفاصيل الشقة';
            }
            return null;
          },
        ),
      ],
    );
  }
}
