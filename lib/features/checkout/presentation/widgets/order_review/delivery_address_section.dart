import '../../../../../core/utils/app_imports.dart';

class DeliveryInfoSection extends StatelessWidget {
  final String locationName;
  final double deliveryCost;
  final String fullAddress;
  final VoidCallback? onEdit;

  const DeliveryInfoSection({
    super.key,
    required this.locationName,
    required this.deliveryCost,
    required this.fullAddress,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF2F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'بيانات التوصيل',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.edit.path,
                      color: const Color(0xff6C7275),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'تعديل',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xff949D9E),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// المنطقة
          Row(
            children: [
              const Icon(
                Icons.location_city_outlined,
                size: 20,
                color: Color(0xff6C7275),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  locationName,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// العنوان
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.images.location.path,
                color: const Color(0xff6C7275),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  fullAddress,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: const Color(0xff4E5556),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// سعر التوصيل
          Row(
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                size: 20,
                color: Color(0xff6C7275),
              ),
              const SizedBox(width: 8),
              Text(
                '$deliveryCost جنيه',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}