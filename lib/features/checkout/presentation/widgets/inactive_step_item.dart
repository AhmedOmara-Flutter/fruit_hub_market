import '../../../../core/utils/app_imports.dart';

class InActiveStepItem extends StatelessWidget {
  final String text;
  final int index;

  const InActiveStepItem({
    super.key,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 27,
          width: 27,
          decoration: const BoxDecoration(
            color: Color(0xffF2F3F3),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$index',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(
            color: AppColor.mainColor,
          ),
        ),
      ],
    );
  }
}