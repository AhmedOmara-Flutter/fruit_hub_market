import 'package:fruit_hub_market/core/utils/app_imports.dart';

void customShowSnakeBar(
  BuildContext context, {
  required Color color,
  required String label,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(label),
    ),
  );
}
