import '../../../../../../../core/utils/app_imports.dart';
import '../../../../core/services/storage_services.dart';
import '../../data/repos/profile_repo_impl.dart';
import '../view_model/profile_cubit.dart';
import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileUploadImageSuccess) {
          customShowSnakeBar(
              context, color: Colors.green, label: 'تم تحميل الصوره بنجاح');
        }
        if (state is ProfileUploadImageError) {
          customShowSnakeBar(
              context, color: Colors.red, label: state.errMessage);
        }
      },
      child: ProfileViewBody(),
    ));
  }
}
