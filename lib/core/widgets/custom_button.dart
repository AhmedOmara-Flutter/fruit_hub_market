import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.child,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed:onPressed,
        child: child,
      ),
    );
  }
}
