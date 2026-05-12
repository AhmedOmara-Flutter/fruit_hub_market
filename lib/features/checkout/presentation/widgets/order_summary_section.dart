import '../../../../core/utils/app_imports.dart';

class OrderSummarySection extends StatelessWidget {
  final double totalPrice;

  const OrderSummarySection({
    super.key, required this.totalPrice,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Color(0xff4E5556)),
                  ),
                  Text(
                    'التوصيل  :',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Color(0xff4E5556)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$totalPrice جنيه',
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    '30 جنيه',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Color(0xff4E5556)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 12,
              left: 20,
              right: 20,
            ),
            child: Divider(color: Color(0xffCACECE)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكلي',
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black),
              ),
              Text(
                '${totalPrice + 30} جنيه',
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
