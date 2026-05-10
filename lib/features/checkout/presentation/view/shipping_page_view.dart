import '../../../../core/utils/app_imports.dart';

class ShippingPageView extends StatefulWidget {
  const ShippingPageView({super.key});

  @override
  State<ShippingPageView> createState() => _ShippingPageViewState();
}

class _ShippingPageViewState extends State<ShippingPageView> {
  int selectedShipping = 0;

  final List<Map<String, String>> shippingOptions = [
    {
      "title": "الدفع عند الاستلام",
      "subtitle": "التسليم من المكان",
      "price": "50 جنيه",
    },
    {
      "title": "الدفع اونلاين",
      "subtitle": "يرجي تحديد طريقه الدفع",
      "price": "50 جنيه",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            itemCount: shippingOptions.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = shippingOptions[index];
              final isSelected = selectedShipping == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedShipping = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xff1B5E37).withOpacity(0.1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xff1B5E37)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff949D9E)
                          ),
                        ),
                        child: isSelected
                            ?  Icon(
                          Icons.circle,
                          size: 16,
                          color:isSelected?const Color(0xff1B5E37):Colors.white,
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
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelLarge,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item["subtitle"]!,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item["price"]!,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          color: const Color(0xff1B5E37),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}