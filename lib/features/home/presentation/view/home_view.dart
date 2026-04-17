import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/home/data/repos/home_repo_impl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeRepoImpl(FirestoreDatabase())),
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}


