import 'package:fruit_hub_market/core/utils/app_imports.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [SizedBox(height: 30), CustomAppBar()]),
    );
  }
}
