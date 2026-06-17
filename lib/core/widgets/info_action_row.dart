import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/core/widgets/custom_back_button.dart';

class InfoActionRow extends StatelessWidget {
  final String text;
  final bool showBack;
  final bool showNotification;
  final bool showSearch;
  final double bottomPadding;
  final void Function()?searchOnPressed;

  const InfoActionRow({
    super.key,
    required this.text,
    this.showBack = false,
    this.showNotification = false,
    this.showSearch = false,
    this.bottomPadding = 20, this.searchOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 40,
        bottom: bottomPadding,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: showBack ? const CustomBackButton() : const SizedBox(),
          ),

          Expanded(
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          SizedBox(
            height: 60,
            width: 60,
            child: _buildRightAction(),
          ),
        ],
      ),
    );
  }

  Widget _buildRightAction() {
    if (showNotification) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: const Color(0xffEEF8ED),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                    color: AppColor.mainColor,
                  ),
                  const CircleAvatar(
                    radius: 4,
                    backgroundColor: Color(0xffF24135),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (showSearch) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:searchOnPressed,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: const Color(0xffF1F1F5)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.images.search.path,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}