import '../../../../core/utils/app_imports.dart';

class ShippingMethodItem extends StatelessWidget {
  const ShippingMethodItem({
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
              ? const Color(0xff1B5E37).withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xff1B5E37) : Colors.grey.shade300,
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
                    ? const Color(0xff1B5E37)
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
            Text(
              item["price"]!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xff1B5E37),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}