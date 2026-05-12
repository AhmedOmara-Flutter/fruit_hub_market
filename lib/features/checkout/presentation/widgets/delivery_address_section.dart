import '../../../../core/utils/app_imports.dart';

class DeliveryAddressSection extends StatelessWidget {
  final String fullAddress;
  final void Function()? onEdit;

  const DeliveryAddressSection({
    super.key, required this.fullAddress, this.onEdit,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(
                'عنوان التوصيل',
                style: Theme
                    .of(
                  context,
                )
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.black),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.edit.path,
                      color: Color(0xff6C7275),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'تعديل',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Color(0xff949D9E)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                Assets.images.location.path,
                color: Color(0xff6C7275),
              ),
              SizedBox(width: 5),

              Text(
                fullAddress,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Color(0xff4E5556)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
