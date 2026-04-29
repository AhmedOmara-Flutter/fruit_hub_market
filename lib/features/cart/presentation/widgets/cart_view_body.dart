import 'package:fruit_hub_market/features/cart/presentation/widgets/cart_info_banner.dart';
import '../../../../core/utils/app_imports.dart';
import 'cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              InfoActionRow(text: 'السله'),
              CartInfoBanner(),
              SizedBox(height: 20),
            ],
          ),
        ),
        CartItemList(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 50),
              CustomButton(
                child: Text(
                  'الدفع 120 جنيه',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
