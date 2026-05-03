import 'package:fruit_hub_market/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_market/core/widgets/products_grid_view.dart';
import 'package:fruit_hub_market/features/search/presentation/view_model/search_cubit.dart';
import 'package:fruit_hub_market/features/search/presentation/widgets/build_search_initial.dart';

import '../../../../core/utils/app_imports.dart';
import 'build_search_empty.dart';
import 'build_search_success.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(instance()),
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoActionRow(text: 'بحث', isBack: true),
                    CustomTextField(
                      onChanged: (value) {
                        context.read<SearchCubit>().search(value);
                      },
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),

              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Skeletonizer.sliver(
                      enabled: true,
                      child: ProductsGridView(products: getDummyProducts()),
                    );
                  }

                  if (state is SearchSuccess) {
                    return BuildSearchSuccess(products: state.products);
                  }

                  if (state is SearchEmpty) {
                    return BuildSearchEmpty(query: state.query);
                  }

                  if (state is SearchError) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errMessage)),
                    );
                  }

                  return BuildSearchInitial();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
