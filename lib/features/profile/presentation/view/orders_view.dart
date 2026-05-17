import 'package:fruit_hub_market/features/profile/presentation/widgets/orders_view_body.dart';

import '../../../../core/utils/app_imports.dart';
import '../../data/repos/profile_repo_impl.dart';
import '../view_model/profile_cubit.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocProvider(
      create: (context) => ProfileCubit(instance())..getOrders(),
      child: OrdersViewBody(),
    ));
  }
}
