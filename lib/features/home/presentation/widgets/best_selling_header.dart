import 'package:fruit_hub_market/core/utils/app_imports.dart';
class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: (){},
        child: Row(
          children: [
             Text(
              'الأكثر مبيعًا',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black),
            ),
            const Spacer(),
            Text(
              'المزيد',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}