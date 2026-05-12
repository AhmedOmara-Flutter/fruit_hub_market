import 'package:lottie/lottie.dart';

import '../utils/app_imports.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffE6E9EA))
          ),
            child: Lottie.asset(Assets.json.foodAnimation.path)
        ),
      ),
    );
  }
}
