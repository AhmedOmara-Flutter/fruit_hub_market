import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/presentation/view_model/home_cubit.dart';
import 'package:fruit_hub_market/features/product/presentation/view_model/product_cubit.dart';


class MainView extends StatelessWidget {
  const MainView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          var cubit = context.read<MainCubit>();
          return IndexedStack(
            index: cubit.currentIndex,
            children: cubit.pages,
          );
        },
      ),
    );
  }
}
