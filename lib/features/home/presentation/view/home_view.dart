import 'package:fruit_hub_market/core/utils/app_imports.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key,});

  @override
  Widget build(BuildContext context) {
    //todo add get_it
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(FirestoreDatabase())),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
        body: HomeViewBody(),
      ),
    );
  }
}
