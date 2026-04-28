import 'package:fruit_hub_market/core/utils/app_imports.dart';
class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 8),
      child: Row(
        children: [
          Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: Theme
                .of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xff1B5E37),
              ),

              onPressed: () {
                Navigator.pushNamed(context, RouteManager.bestSellingMore,);
              },
              child: Text('المزيد',
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ))
        ],
      ),
    );
  }
}