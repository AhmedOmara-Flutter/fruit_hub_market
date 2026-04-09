// import 'package:fruit_hub_market/core/utils/app_imports.dart';
// part 'home_state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//
// UserEntity ?userEntity;
//   Future<void> getProfileData() async {
//     emit(GetProfileDataLoadingState());
//     if (Constants.uId.isNotEmpty) {
//        await FirebaseFirestore.instance
//           .collection('users')
//           .doc(Constants.uId)
//           .get()
//           .then((value) {
//            // userEntity = UserModel.fromFirebaseUser(value.data());
//             emit(GetProfileDataSuccessState());
//
//           })
//           .catchError((error) {
//             emit(GetProfileDataErrorState(error: error.toString()));
//             print(error);
//           });
//     }
//   }
// }
