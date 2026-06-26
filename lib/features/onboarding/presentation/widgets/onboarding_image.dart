import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingImage extends StatelessWidget {
  final String image;
  const OnBoardingImage({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -50,
        child: Center(child: Image.asset(
          image,
          height: MediaQuery.of(context).size.width*0.9,
          width: MediaQuery.of(context).size.width*0.9,
        ))
    );
  }
}
