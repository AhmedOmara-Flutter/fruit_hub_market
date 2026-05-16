import 'package:fruit_hub_market/core/widgets/custom_loading.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/checkout_cubit.dart';
import 'checkout_stepper.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutAddOrderSuccess) {
          AppVibration.heavy();
          AppSounds.playClickSound('payment.mp3');

          customShowSnakeBar(
              context, color: AppColor.mainColor, label: 'تم تأكيد طلبك بنجاح');
          Navigator.pushNamed(context,RouteManager.paymentSuccess,);
        } else if (state is CheckoutAddOrderError) {
          AppVibration.heavy();
          AppSounds.playClickSound('click_error.wav');

          customShowSnakeBar(context, color: AppColor.red, label: state.error);
        }
      },
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return Stack(
          children: [
            Column(
              children: [
                InfoActionRow(
                  text: cubit.stepperTitles[cubit.currentIndex],
                  isBack: true,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CheckoutStepper(
                          currentIndex: cubit.currentIndex,
                          stepperTitles: cubit.stepperTitles,
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: cubit.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.stepperPages.length,
                            onPageChanged: (index) {
                              cubit.changePage(index);
                            },
                            itemBuilder: (context, index) {
                              return cubit.stepperPages[index];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            if (state is CheckoutAddOrderLoading)
              Positioned.fill(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                      color: Colors.black.withOpacity(0.3),
                      child: LoadingWidget()
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
