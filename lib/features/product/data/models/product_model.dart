
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
    super.sellingCount=0,
    required super.id,
    super.subImages,
    super.averageRating=0.0,
    super.reviewsCount=0,
    super.ratingSum=0.0,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
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
      sellingCount: entity.sellingCount,
      subImages: entity.subImages,
      averageRating: entity.averageRating,
      reviewsCount: entity.reviewsCount,
      ratingSum: entity.ratingSum,
    );
  }


  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
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
      imageFile: imageFile,
      sellingCount: sellingCount,
      subImages: subImages,
      averageRating: averageRating,
      reviewsCount: reviewsCount,
      ratingSum: ratingSum,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {

    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
      image: json['image'],
      expirationMonth: json['expirationMonth'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      isOrganic: json['isOrganic'] ?? false,
      sellingCount: json['sellingCount'] ?? 0,

      subImages: (json['subImages'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      averageRating: json['averageRating'] ?? 0.0,
      reviewsCount: json['reviewsCount'] ?? 0,
      ratingSum: json['ratingSum'] ?? 0.0,
    );

  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
      'sellingCount': sellingCount,
      'subImages': subImages,
      'averageRating': averageRating,
      'reviewsCount': reviewsCount,
      'ratingSum': ratingSum,
    };
  }
}
