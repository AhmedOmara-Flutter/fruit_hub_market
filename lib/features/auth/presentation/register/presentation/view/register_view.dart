import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_market/features/auth/presentation/register/presentation/widgets/register_view_body.dart';

import '../../../../../../core/utils/app_imports.dart';
import '../../../../data/repos/auth_repo_impl.dart';
import '../view_model/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("حساب جديد"), centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) =>
              RegisterCubit(AuthRepoImpl(
                  authRemoteDataSource: AuthRemoteDataSourceImpl())),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.green,
                      content: Text(
                          'Registration done successfully'
                      ),));
              }
              if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.red,
                      content: Text(
                          state.errMessage
                      ),));
              }
            },
            builder: (context, state) {
              return RegisterViewBody();
            },
          ),
        ));
  }
}
