import 'package:fruit_hub_market/core/helper_function/custom_show_dialog.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileInfoBanner extends StatelessWidget {
  const ProfileInfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customShowDialog(context, title: 'هل ترغب في تسجيل الخروج ؟',
            content: Text(
              'سيتم تسجيل خروجك من التطبيق',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Colors.grey),
            ),
            cancel: () {
              Navigator.pop(context);
            },
            accept: () async{
              await instance<AuthRepo>().signOut();
              Navigator.pushReplacementNamed(context, RouteManager.login);
              context.read<MainCubit>().currentIndex=0;
            }
        );
      },
      child: Container(
        width: double.infinity,
        color: AppColor.mainColor.withOpacity(0.1),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20,),
            Text(
              'تسجيل الخروج',
              style: Theme
                  .of(
                context,
              )
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColor.mainColor),
              textAlign: TextAlign.center,
            ),
            Transform.scale(
              scaleX: -1,
              child: Icon(
                  Icons.logout, color: AppColor.mainColor.withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}
