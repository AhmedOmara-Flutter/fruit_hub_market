import '../../../../core/utils/app_imports.dart';

class ActiveStepItem extends StatelessWidget {
  final String text;

  const ActiveStepItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 20,
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