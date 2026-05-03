
import 'package:fruit_hub_market/core/widgets/custom_text_field.dart';

import '../../../../core/utils/app_imports.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.search);
      },
      readOnly: true,
    );
  }
}
