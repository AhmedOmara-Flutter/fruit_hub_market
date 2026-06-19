import '../../../../../core/utils/app_imports.dart';
import '../../view_model/checkout_cubit.dart';
import '../../widgets/select_location_card.dart';
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
                return SelectLocationCard(isSelected: false, item: item, onTap: () {});
              },
            ),
          ),
          CustomButton(
            onPressed: () {
                cubit.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
            },
            child: Text('التالي', style: Theme.of(context).textTheme.labelSmall),
          ),
          SizedBox(height: 30),
      
        ],
      ),
    );
  }
}
