import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/select_location_card.dart';

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cubit.placesOptions.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = cubit.placesOptions[index];
                return SelectLocationCard(
                  isSelected: cubit.selectedLocationIndex == index,
                  item: item,
                  onTap: () {
                    cubit.changeSelectedLocationIndex(index);
                  },
                );
              },
            ),
          ),
          CustomButton(
            onPressed: () {
              if (cubit.selectedLocationIndex ==null) {
                AppVibration.heavy();
                AppSounds.playClickSound('click_error.wav');

                customShowSnakeBar(
                  context,
                  color: AppColor.red,
                  label: 'يرجي اختيار مكان التوصيل',
                );
                return;
              }

              if (cubit.selectedLocationIndex == null) {
                return;
              }

              final selected =
                  cubit.placesOptions[cubit.selectedLocationIndex!];

              cubit.orderEntity.selectedLocationEntity = selected;

              print(cubit.orderEntity.selectedLocationEntity!.title);
              print(cubit.orderEntity.selectedLocationEntity!.cost);
              cubit.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'التالي',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
