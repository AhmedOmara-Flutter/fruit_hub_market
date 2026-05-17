import '../../../../core/utils/app_imports.dart';

class OrdersLoadingWidget extends StatelessWidget {
  const OrdersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(itemBuilder: (context, index) =>
        Skeletonizer(
          enabled: true,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF2F3F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [

                /// image
                const Icon(Icons.image, size: 65,),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        /// top section
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'طلب رقم : 87452658452#',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .labelLarge,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'تم الطلب : ١٧ مايو ٢٠٢٦',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.more_vert),
                          ],
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'عدد الطلبات : ',
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall,
                            children: [
                              TextSpan(
                                text: '7   ',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelLarge,
                              ),
                              TextSpan(
                                text: '850 جنية',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      separatorBuilder: (context, index) => SizedBox(height: 15,),
      itemCount: 5,);
  }
}