import '../../../core/utils/app_imports.dart';

class RatingBarItem extends StatelessWidget {
  final int star;
  final double value;

  const RatingBarItem({super.key, required this.star, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor:Color(0xffE4E6E7),
                  color: Color(0xffFFB400),
                  minHeight: 8,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Text(
            "$star",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
