
import 'package:fruit_hub_market/core/helper_function/get_average_rating.dart';
import 'package:fruit_hub_market/features/product/data/models/review_model.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.name,
    required super.code,
    required super.price,
    required super.description,
    super.imageFile,
    required super.isFeatured,
    super.image,
    required super.expirationMonth,
    required super.unitAmount,
    required super.numberOfCalories,
    super.isOrganic = false,
    super.avgRating = 0.0,
    super.ratingCount = 0,
    super.sellingCount=0,
    required super.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      imageFile: entity.imageFile,
      isFeatured: entity.isFeatured,
      image: entity.image,
      expirationMonth: entity.expirationMonth,
      unitAmount: entity.unitAmount,
      numberOfCalories: entity.numberOfCalories,
      isOrganic: entity.isOrganic,
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
      sellingCount: entity.sellingCount,
      reviews: entity.reviews,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      image: image,
      code: code,
      description: description,
      isFeatured: isFeatured,
      expirationMonth: expirationMonth,
      unitAmount: unitAmount,
      numberOfCalories: numberOfCalories,
      isOrganic: isOrganic,
      avgRating: avgRating,
      ratingCount: ratingCount,
      imageFile: imageFile,
      sellingCount: sellingCount,
        reviews: reviews
    );
  }

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     name: json['name'],
  //     code: json['code'],
  //     price: json['price'],
  //     description: json['description'],
  //     //imageFile: json['imageFile'],
  //     isFeatured: json['isFeatured'],
  //     image: json['image'],
  //     expirationMonth: json['expirationMonth'],
  //     unitAmount: json['unitAmount'],
  //     numberOfCalories: json['numberOfCalories'],
  //     isOrganic: json['isOrganic'],
  //     //todo handle it
  //     avgRating: getAverageRating(json['reviews'] is List ?
  //     (json['reviews'] as List)
  //         .map((e) => ReviewModel.fromJson(e).toEntity())
  //         .toList() : [],),
  //     ratingCount: json['ratingCount'],
  //     sellingCount: json['sellingCount'],
  //     reviews: json['reviews'] is List ?
  //     (json['reviews'] as List)
  //         .map((e) => ReviewModel.fromJson(e).toEntity())
  //         .toList() : [],
  //   );
  // }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsList = (json['reviews'] as List<dynamic>?)
        ?.where((e) => e != null)
        .map((e) => ReviewModel.fromJson(e).toEntity())
        .toList() ??
        [];

    return ProductModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      // imageFile: null, // ❌ ماينفعش ييجي من Firebase أصلاً
      isFeatured: json['isFeatured'] ?? false,
      image: json['image'],
      expirationMonth: json['expirationMonth'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      avgRating: getAverageRating(reviewsList),
      ratingCount: json['ratingCount'] ?? 0,
      sellingCount: json['sellingCount'] ?? 0,
      reviews: reviewsList,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'isFeatured': isFeatured,
      'image': image,
      'expirationMonth': expirationMonth,
      'unitAmount': unitAmount,
      'numberOfCalories': numberOfCalories,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'sellingCount': sellingCount,
      'reviews': reviews
          .map((e) => ReviewModel.fromEntity(e).toJson())
          .toList(),
    };
  }
}
