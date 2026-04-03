
import '../../../../../core/utils/app_imports.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("حساب جديد",),
          centerTitle: true,
        ),
        body: RegisterViewBody());
  }
}
