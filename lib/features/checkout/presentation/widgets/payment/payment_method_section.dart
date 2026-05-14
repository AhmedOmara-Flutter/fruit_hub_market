import '../../../../../core/utils/app_imports.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text('أختار طريقه الدفع المناسبه :', style: Theme
            .of(context)
            .textTheme
            .labelLarge!
            .copyWith(
            color: Colors.black
        ),),
        SizedBox(height: 20,),
        Text('من فضلك اختر طريقه الدفع المناسبه لك.', style: Theme
            .of(context)
            .textTheme
            .titleSmall!
            .copyWith(
            color: Color(0xff616A6B)
        ),),
        SizedBox(height: 15,),
        Row(
          spacing: 10,
          children: [
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Color(0xffD6DCE5)
                ),
              ),
              child: Center(child: SvgPicture.asset(
                Assets.images.paypal.path, height: 20, width: 20,)),
            ),
            Container(
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Color(0xffD6DCE5)
                ),
              ),
              child: Center(child: SvgPicture.asset(
                Assets.images.mastercard.path, height: 30, width: 30,)),
            ),
          ],
        ),
      ],
    );
  }
}
