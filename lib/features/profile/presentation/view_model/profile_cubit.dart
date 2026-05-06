// import 'dart:io';
//
// import 'package:bloc/bloc.dart';
// import 'package:fruit_hub_market/features/profile/domain/repos/profile_repo.dart';
// import 'package:meta/meta.dart';
//
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit(this._profileRepo) : super(ProfileInitial());
//   final ProfileRepo _profileRepo;
//
//    String imageUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs_aMoCDAkVZluRbcd0H1DA9exUnhbXNlzgA&s';
//
//
//   void addImage(File imageFile) async {
//     emit(ProfileUploadImageLoading());
//     try {
//       final result = await _profileRepo.uploadImage(imageFile);
//       result.fold(
//         (failure) {
//           emit(ProfileUploadImageError(errMessage: failure.errMessage));
//         },
//         (url) async {
//           imageUrl = url;
//           var result = await _profileRepo.addImage(url);
//           result.fold(
//             (failure) {
//               emit(ProfileUploadImageError(errMessage: failure.errMessage));
//             },
//             (data) {
//               emit(ProfileUploadImageSuccess(
//                 image: url,
//               ));
//             },
//           );
//         },
//       );
//     } catch (e) {
//       print(e);
//       emit(ProfileUploadImageError(errMessage: e.toString()));
//     }
//   }
//
//   Future getImage() async {
//     emit(ProfileGetImageLoading());
//     final result = await _profileRepo.getImage();
//     result.fold(
//       (failure) {
//         emit(ProfileGetImageError(errMessage: failure.errMessage));
//       },
//       (data) {
//         imageUrl = data;
//         print('the method from get image is$data');
//         emit(ProfileGetImageSuccess(image: data));
//       },
//     );
//   }
// }
