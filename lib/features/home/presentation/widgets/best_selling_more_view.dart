import 'package:fruit_hub_market/features/home/presentation/view_model/home_cubit.dart';

import '../../../../core/utils/app_imports.dart';
import 'best_selling_more_view_body.dart';

class BestSellingMoreView extends StatelessWidget {
  const BestSellingMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<HomeCubit>(context),
      child: Scaffold(
        body: BestSellingMoreViewBody(),
      ),
    );
  }
}
