import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/selection_card.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              itemCount: cubit.placesOptions.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = cubit.placesOptions[index];
                return SelectionCard(isSelected: false, item: item, onTap: () {});
              },
            ),
          ),
          CustomButton(
            onPressed: () {
            //  if (cubit.isCashOnDelivery != null) {
                cubit.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                //cubit.orderEntity.isCashOnDelivery = cubit.isCashOnDelivery;
              // } else {
              //   AppVibration.heavy();
              //   AppSounds.playClickSound('click_error.wav');
              //   customShowSnakeBar(
              //     context,
              //     color: AppColor.red,
              //     label: 'يرجي اختيار طريقه الدفع',
              //   );
              // }
            },
            child: Text('التالي', style: Theme.of(context).textTheme.labelSmall),
          ),
          SizedBox(height: 30),
      
        ],
      ),
    );
  }
}
