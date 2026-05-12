import 'package:fruit_hub_market/features/checkout/domain/entities/address_entity.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/checkout_cubit.dart';
import '../widgets/address_form_section.dart';
import '../widgets/checkout_navigation_buttons.dart';

class AddressPageView extends StatefulWidget {
  const AddressPageView({super.key});

  @override
  State<AddressPageView> createState() => _AddressPageViewState();
}

class _AddressPageViewState extends State<AddressPageView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var apartmentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            AddressFormSection(nameController: nameController,
                emailController: emailController,
                addressController: addressController,
                countryController: countryController,
                apartmentController: apartmentController),
            Spacer(),
            BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, state) {
                final cubit = context.read<CheckoutCubit>();
                return CheckoutNavigationButtons(onBack: () {
                  cubit.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,);
                }, onNext: () {
                  if (formKey.currentState!.validate()) {
                    cubit.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    cubit.orderEntity.addressEntity = AddressEntity(
                        name: nameController.text,
                        email: emailController.text,
                        address: addressController.text,
                        country: countryController.text,
                        apartment: apartmentController.text);
                  } else {
                    customShowSnakeBar(
                      context,
                      color: Colors.red,
                      label: 'يرجي ملئ بياناتك',
                    );
                    setState(() {
                      autoValidateMode = AutovalidateMode.disabled;
                    });
                  }
                },);
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

