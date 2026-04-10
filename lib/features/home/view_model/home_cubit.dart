import 'package:fruit_hub_market/core/utils/app_imports.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._authRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
final AuthRepo _authRepo;

  UserEntity? userEntity;

  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    if (Constants.uId.isNotEmpty) {
      await
          _authRepo.getUserData(uId: Constants.uId)
          .then((value) {
            userEntity = value;
            print(value);
            emit(GetProfileDataSuccessState(userEntity: userEntity!));
          })
          .catchError((error) {
            emit(GetProfileDataErrorState(error: error.toString()));
          });
    }
  }
}
