import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../core/utils/app_imports.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
          InfoActionRow(text: 'تتبع الطلب', showBack: true),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffF2F3F3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEBF9F1),
              ),
              child: SvgPicture.asset(
                Assets.images.package.path,
              ),),
            SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طلب رقم : 1234567#',
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'تم الطلب : 22 مارس ,2024 ',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      color: Color(0xff949D9E),
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: ' عدد الطلبات : ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                        color: Color(0xff949D9E),
                      ),
                      children: [
                        TextSpan(
                          text: '10   ',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '250 جنية',
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            color: Colors.black,
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      SizedBox(height: 20,),
      // Container(
      //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      //     margin: EdgeInsets.symmetric(horizontal: 20),
      //     decoration: BoxDecoration(
      //       color: Color(0xffF2F3F3),
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Column(
      //     children:[
      //       Row(
      //         children: [
      //           Column(
      //             children: [
      //               Container(
      //                 padding: EdgeInsets.all(20),
      //                 decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: Color(0xffEBF9F1),
      //                 ),
      //                 child: SvgPicture.asset(
      //                   Assets.images.package.path,
      //                 ),),
      //             Container(
      //               color: Colors.red,
      //               width: 1,
      //               height: 40,
      //             )
      //             ],
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'تتبع الطلب',
      //                   style: Theme
      //                       .of(
      //                     context,
      //                   )
      //                       .textTheme
      //                       .labelLarge!
      //                       .copyWith(color: Colors.black),
      //                 ),
      //                 SizedBox(height: 2),
      //                 Text(
      //                   '22 مارس , 2024',
      //                   style: Theme
      //                       .of(context)
      //                       .textTheme
      //                       .titleSmall!
      //                       .copyWith(
      //                     color: Color(0xff949D9E),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //
      //     ],
      //   )
      // )
        ],
      ),
    );
  }
}




