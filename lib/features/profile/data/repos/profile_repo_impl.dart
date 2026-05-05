import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_market/core/services/storage_services.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

import '../../domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final StorageServices _storageServices;
  final DatabaseServices _databaseServices;

  ProfileRepoImpl(this._storageServices, this._databaseServices);


  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      String url = await _storageServices.uploadImage(
        imageFile,
        'profileImage',
      );
      return right(url);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addImage(String image) async {
    try {
      final result = await _databaseServices.addData(
        path: 'profileImage',
        data: {'image': image},
        uId: Constants.uId,
      );
      return right(result);
    } catch (e) {
      print('the result from add image $e');
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getImage() async {
    try {
      final result = await _databaseServices.getData(
        path: 'profileImage',
        uId: Constants.uId,
      );
      return right(result['image']);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
