import '../../../../core/utils/app_imports.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    super.key,
    required this.isSelected,
    required this.item,
    this.onTap,
  });

  final void Function()? onTap;
  final bool isSelected;
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.mainColor.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColor.mainColor : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff949D9E)),
              ),
              child: isSelected
                  ? Icon(
                Icons.circle,
                size: 16,
                color: isSelected
                    ? AppColor.mainColor
                    : Colors.white,
              )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"]!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["subtitle"]!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["price"]!,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}