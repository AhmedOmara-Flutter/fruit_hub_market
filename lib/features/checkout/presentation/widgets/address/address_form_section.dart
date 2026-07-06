import '../../../../../core/utils/app_imports.dart';

class AddressFormSection extends StatelessWidget {
  const AddressFormSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.apartmentController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController apartmentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'الاسم الكامل',
          controller: nameController,
          prefixIcon: Icons.person,
          hintText: 'أدخل اسمك بالكامل',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل الاسم الكامل';
            }
            if (value.trim().length < 3) {
              return 'الاسم قصير جدًا';
            }
            return null;
          },
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          label: 'رقم الهاتف',
          controller: emailController,
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          hintText: '01xxxxxxxxx',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل رقم الهاتف';
            }
            return null;
          },
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          label: 'العنوان',
          controller: addressController,
          prefixIcon: Icons.home_outlined,
          hintText: 'الشارع والمنطقة',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل العنوان';
            }
            return null;
          },
        ),

        SizedBox(height: 15.h),

        CustomTextFormField(
          label: 'تفاصيل الشقة',
          controller: apartmentController,
          prefixIcon: Icons.apartment,
          hintText: 'رقم العمارة، الطابق، الشقة...',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'من فضلك أدخل تفاصيل الشقة';
            }
            return null;
          },
        ),
      ],
    );
  }
}
