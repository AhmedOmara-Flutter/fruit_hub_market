import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/main/presentation/view/pages/home/view_model/home_cubit.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(MainRepoImpl(FirestoreDatabase())),
      child: HomeViewBody(),
    );
  }
}

