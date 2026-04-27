import 'package:fruit_hub_market/core/utils/app_imports.dart';


class MainView extends StatelessWidget {
  const MainView({super.key,});

  @override
  Widget build(BuildContext context) {
    //todo add get_it
    return BlocProvider(
      create: (context) =>
          MainCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        body: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return context
                .read<MainCubit>()
                .pages[context
                .read<MainCubit>()
                .currentIndex];
          },
        ),
      ),
    );
  }
}
