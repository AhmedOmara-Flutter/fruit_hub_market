import 'package:fruit_hub_market/core/helper_function/custom_show_dialog.dart';
import 'package:fruit_hub_market/features/profile/presentation/widgets/logout_loading_page.dart';
import '../../../../core/utils/app_imports.dart';

class ProfileSignOut extends StatelessWidget {
  const ProfileSignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          CustomShowDialog.show(
            context,
            title: 'تسجيل الخروج',
            content: Text(
              'هل أنت متأكد أنك تريد تسجيل الخروج؟',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.grey,
              ),
            ),
            color: Colors.red,
            flag: Icons.logout,
            cancel: () => Navigator.pop(context),
            accept: () async {
              await instance<AuthRepo>().signOut();
              context.read<MainCubit>().currentIndex = 0;

              Navigator.pushReplacementNamed(context, RouteManager.logoutLoading);
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.06),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.red.withOpacity(0.15),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  'تسجيل الخروج',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.red.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}