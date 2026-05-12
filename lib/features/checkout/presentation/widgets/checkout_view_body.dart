import '../../../../core/utils/app_imports.dart';
import '../view_model/checkout_cubit.dart';
import 'checkout_stepper.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        return Column(
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
        );
      },
    );
  }
}
