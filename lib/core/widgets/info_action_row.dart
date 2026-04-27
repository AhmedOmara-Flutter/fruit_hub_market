import 'package:fruit_hub_market/core/utils/app_imports.dart';

class InfoActionRow extends StatelessWidget {
  final String text;
  final bool isBack;

  const InfoActionRow({super.key, required this.text,this.isBack=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          !isBack?SizedBox():ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xffF1F1F5)
                  ),
                ),
                child: Center(child: SvgPicture.asset(Assets.images.arrowBack.path,)),
              ),
            ),
          ),
          Text(text, style: Theme.of(context).textTheme.displaySmall),
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
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xffF24135),
                      ),
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
