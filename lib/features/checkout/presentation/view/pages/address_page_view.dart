import 'package:fruit_hub_market/core/entities/address_entity.dart';

import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/address/address_button_section.dart';
import '../../widgets/address/address_form_section.dart';

class AddressPageView extends StatefulWidget {
  const AddressPageView({super.key});

  @override
  State<AddressPageView> createState() => _AddressPageViewState();
}

class _AddressPageViewState extends State<AddressPageView>
    with AutomaticKeepAliveClientMixin {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var apartmentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    AddressFormSection(
                      nameController: nameController,
                      emailController: emailController,
                      addressController: addressController,
                      countryController: countryController,
                      apartmentController: apartmentController,
                    ),
                    SizedBox(height: 30),
                    Spacer(),
                    BlocBuilder<CheckoutCubit, CheckoutState>(
                      builder: (context, state) {
                        final cubit = context.read<CheckoutCubit>();
                        return AddressButtonSection(
                          onBack: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            cubit.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          onNext: () {
                            FocusManager.instance.primaryFocus?.unfocus();
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
                                apartment: apartmentController.text,
                              );
                            } else {
                              AppVibration.heavy();
                              AppSounds.playClickSound('click_error.wav');
                              customShowSnakeBar(
                                context,
                                color: AppColor.red,
                                label: 'يرجي ملئ بياناتك',
                              );
                              setState(() {
                                autoValidateMode = AutovalidateMode.disabled;
                              });
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
