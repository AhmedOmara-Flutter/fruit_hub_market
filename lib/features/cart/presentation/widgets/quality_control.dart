
import '../../../../core/utils/app_imports.dart';

class QualityControl extends StatelessWidget {
  const QualityControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: width * 0.045,
            ),
          ),
        ),

        SizedBox(width: 5),

        Text(
          '3',
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: Colors.black),
        ),

        SizedBox(width: width * 0.02),

        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.remove, size: width * 0.045),
          ),
        ),
      ],
    );
  }
}
