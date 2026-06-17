import 'package:fruit_hub_market/features/product/presentation/widgets/category_tabs.dart';
import 'package:fruit_hub_market/features/product/presentation/widgets/items_count_label.dart';

import '../../../../../../../core/utils/app_imports.dart';
import '../../../../core/cubit/product_cubit/product_cubit.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {

  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoActionRow(
          text: 'المنتجات',
          showSearch: true,
          searchOnPressed: () {
            Navigator.pushNamed(context, RouteManager.search);
          },
        ),
        // ItemsCountLabel(
        //   productsNumber: context.watch<ProductCubit>().productsNumber,
        // ),
        Expanded(child: CategoryTabs()),
      ],
    );
  }
}
