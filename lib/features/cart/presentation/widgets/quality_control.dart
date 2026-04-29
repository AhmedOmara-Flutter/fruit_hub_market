
import '../../../../core/utils/app_imports.dart';

class QualityControl extends StatelessWidget {
  final double buttonSize;
  const QualityControl({
    super.key, this.buttonSize = 35,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: buttonSize,
          height: buttonSize,
          decoration: const BoxDecoration(
            color: Color(0xff1B5E37),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: buttonSize * 0.5,
            ),
          ),
        ),

        SizedBox(width: 15),

        Text(
          '3',
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: Colors.black),
        ),

        SizedBox(width: 15),

        Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.remove, size: buttonSize * 0.5),
          ),
        ),
      ],
    );
  }
}
