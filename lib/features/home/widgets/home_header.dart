import 'package:fruit_hub_market/core/helper_function/get_user.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 20),
      child: Row(
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
                getUser().userName,
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
      ),
    );
  }
}
