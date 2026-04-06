import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_market/core/helper_function/custom_show_snake_bar.dart';
import 'package:fruit_hub_market/core/services/service_locator.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/register_view_body.dart';

import '../../../../../../core/utils/app_imports.dart';
import '../view_model/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("حساب جديد"), centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(instance()),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if(state is RegisterLoading){
                CircularProgressIndicator();
              }
              if (state is RegisterSuccess) {
                customShowSnakeBar(
                    context, color: Colors.green, label: 'تم انشاء الحساب بنجاح');
                Navigator.pushNamed(context, RouteManager.login);
              }
              if (state is RegisterError) {
                customShowSnakeBar(
                    context, color: Colors.red, label: state.errMessage);
              }
            },
            builder: (context, state) {
              return RegisterViewBody();
            },
          ),
        )
    );
  }
}
