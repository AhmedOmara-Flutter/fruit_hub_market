import '../../../../core/utils/app_imports.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Text('ملخص الطلب :', style: Theme
            .of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.black),),
        SizedBox(height: 20,),
        Container(
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
                      Text('المجموع الفرعي :', style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                          color: Color(0xff4E5556)
                      ),),
                      Text('التوصيل  :', style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                          color: Color(0xff4E5556)
                      ),),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('150 جنيه', style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                          color: Colors.black
                      ),),
                      Text('30 جنيه', style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                          color: Color(0xff4E5556)
                      ),),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 12, left: 20, right: 20),
                child: Divider(
                  color: Color(0xffCACECE),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الكلي', style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(
                      color: Colors.black
                  ),),
                  Text('180 جنيه', style: Theme
                      .of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(
                      color: Colors.black
                  ),),


                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  Text('عنوان التوصيل', style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(
                      color: Colors.black
                  ),),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.images.edit.path, color: Color(0xff6C7275),),
                      SizedBox(width: 5,),
                      Text('تعديل', style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                          color: Color(0xff949D9E)
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.location.path, color: Color(0xff6C7275),),
                  SizedBox(width: 5,),

                  Text('شارع النيل، مبنى رقم ١٢٣', style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                      color: Color(0xff4E5556)
                  ),),
                ],
              )


            ],
          ),
        ),


      ],
    );
  }
}
