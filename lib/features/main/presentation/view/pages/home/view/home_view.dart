import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/main/presentation/view/pages/home/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {

  const HomeView({super.key,});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<MainCubit>(context).getSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}

