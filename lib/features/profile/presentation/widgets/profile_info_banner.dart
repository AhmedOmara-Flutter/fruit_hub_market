
import '../../../../core/utils/app_imports.dart';

class ProfileInfoBanner extends StatelessWidget {
  const ProfileInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.mainColor.withOpacity(0.1),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20,),
          Text(
            'تسجيل الخروج',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColor.mainColor),
            textAlign: TextAlign.center,
          ),
          Transform.scale(
            scaleX: -1,
            child: Icon(Icons.logout, color: AppColor.mainColor.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
