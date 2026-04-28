import 'package:fruit_hub_market/core/utils/app_imports.dart';


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
