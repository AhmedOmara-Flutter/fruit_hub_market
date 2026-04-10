import 'package:fruit_hub_market/core/utils/app_imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit
            .get(context)
            .userEntity;
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(Assets.images.homeImage.path),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text(
              'صباح الخير !..',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Color(0xff949D9E),
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              cubit?.userName ?? 'جاري التحميل...',
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Color(0xff0C0D0D)),
            )
          ],
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Material(
            color: Color(0xffEEF8ED),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Color(0xff1B5E37),
                    ),
                    CircleAvatar(radius: 4, backgroundColor: Color(0xffF24135)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
      },
    );
  }
}
