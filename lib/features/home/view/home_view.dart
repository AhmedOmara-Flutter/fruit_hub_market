import 'package:fruit_hub_market/core/utils/app_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
            automaticallyImplyLeading: false,
        ),
      body: HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar()

      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
CircleAvatar(
  radius: 40,
  child: SvgPicture.asset(Assets.images.splashCenter.path),
)

    ],);
  }
}
