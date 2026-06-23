import '../../../../core/entities/order_entity.dart';
import '../../../../core/utils/app_imports.dart';
import '../../../cart/presentation/view_model/cart_cubit.dart';

class PaymentSuccessView extends StatelessWidget {
  final OrderEntity orderEntity;
  const PaymentSuccessView({super.key, required this.orderEntity,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InfoActionRow(text: 'الدفع'),
          SizedBox(height: 35),
          AspectRatio(
            aspectRatio: 3,
            child: SvgPicture.asset(Assets.images.paymentSuccess.path),
          ),
          SizedBox(height: 30),
          Text(
            'تم بنجاح !',
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: Colors.black),
          ),
          SizedBox(height: 15),
          Text(
            'رقم الطلب : ${orderEntity.id}#',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff4E5556)),
          ),
          Spacer(),
          // GestureDetector(
          //   onTap: (){
          //     context.read<CartCubit>().cart.cartItems.clear();
          //     context.read<CartCubit>().saveCart();
          //     context.read<MainCubit>().currentIndex=0;
          //     Navigator.pushNamed(context, RouteManager.home,);
          //   },
          //   child: Text(
          //       "الرئيسيه",
          //       style: Theme.of(context).textTheme.labelSmall!.copyWith(
          //           color: AppColor.mainColor,
          //           decoration: TextDecoration.underline
          //       )
          //   ),
          // ),
          SizedBox(height: 10,),
          CustomButton(
            onPressed: () {
              context.read<CartCubit>().cart.cartItems.clear();
              context.read<CartCubit>().saveCart();
              context.read<MainCubit>().currentIndex=0;
              Navigator.pushNamed(context, RouteManager.home,);
            },
            child: Text(
              'الرئيسيه',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
