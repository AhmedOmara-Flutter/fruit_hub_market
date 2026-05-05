import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> uploadImage(File imageFile);

  Future<Either<Failure, void>> addImage(String image);

  Future<Either<Failure, String>> getImage();
}
