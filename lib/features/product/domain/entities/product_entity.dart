import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruit_hub_market/features/product_details/domain/entities/review_entity.dart';

// ignore_for_file: must_be_immutable
class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String code;
  final num price;
  final String description;
  final File ?imageFile;
  final bool isFeatured;
  String? image;
  final num expirationMonth;
  final num unitAmount;
  final num numberOfCalories;
  final bool isOrganic;
  final double avgRating;
  final int ratingCount;
  int sellingCount;
  List<String> ?subImages;




  ProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
     this.imageFile,
    required this.isFeatured,
    this.image,
    required this.expirationMonth,
    required this.unitAmount,
    required this.numberOfCalories,
    this.isOrganic = false,
    this.avgRating = 0.0,
    this.ratingCount = 0,
    this.sellingCount = 0,
    required this.id,
    this.subImages,
  });


  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
