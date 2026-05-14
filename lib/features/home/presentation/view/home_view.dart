import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/favorite/presentation/view_model/favorite_cubit.dart';

import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {

      },
      child: HomeViewBody(),
    );
  }
}

