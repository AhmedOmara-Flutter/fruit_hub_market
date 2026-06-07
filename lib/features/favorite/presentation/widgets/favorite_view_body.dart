import 'package:fruit_hub_market/features/favorite/presentation/view_model/favorite_cubit.dart';
import 'package:fruit_hub_market/features/favorite/presentation/widgets/empty_favorite_widget.dart';

import '../../../../core/utils/app_imports.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/products_grid_view.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: InfoActionRow(text: 'المفضلة', isBack: true)),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is GetFavoriteLoadingState) {
              return Skeletonizer.sliver(
                enabled: true,
                child: ProductsGridView(products: getDummyProducts()),
              );
            }
            if (state is GetFavoriteSuccessState) {
              return ProductsGridView(products: state.favoriteProducts);
            }
            if (state is GetFavoriteErrorState) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.error)),
              );
            }

            if (state is GetFavoriteEmptyState) {
              return SliverToBoxAdapter(child: EmptyWidget());
            }

            return const SliverToBoxAdapter(child: SizedBox());
          },
        ),
      ],
    );
  }
}
