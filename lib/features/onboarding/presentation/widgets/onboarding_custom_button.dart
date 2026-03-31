import 'package:fruit_hub_market/core/utils/app_imports.dart';

class OnBoardingCustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const OnBoardingCustomButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      child: Text(label, style: TextTheme.of(context).labelSmall),
    );
  }
}
