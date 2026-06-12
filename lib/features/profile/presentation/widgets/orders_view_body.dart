import 'package:fruit_hub_market/core/widgets/empty_widget.dart';

import '../../../../core/utils/app_imports.dart';
import '../view_model/profile_cubit.dart';
import 'empty_order_widget.dart';
import 'order_item.dart';
import 'orders_loading_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: InfoActionRow(text: 'طلباتي', isBack: true)),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            print('state is ${state.runtimeType}');
            if (state is ProfileGetOrdersSuccess) {
              if(state.orders.isEmpty) {
                return SliverToBoxAdapter(
                  child:EmptyWidget(),
                );
              }   else {
                return SliverList.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      OrderItem(orderEntity: state.orders[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 15,),
                  itemCount: state.orders.length,
                );
              }
            }
            if (state is ProfileGetOrdersError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.errMessage)),
              );
            }
              return OrdersLoadingWidget();
          },
        ),
      ],
    );
  }
}
