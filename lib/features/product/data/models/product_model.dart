
import 'package:fruit_hub_market/core/helper_function/get_average_rating.dart';
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
    required super.id,
    super.isFavorite=false,
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
      avgRating: entity.avgRating,
      ratingCount: entity.ratingCount,
      sellingCount: entity.sellingCount,
      isFavorite: entity.isFavorite,
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
      avgRating: avgRating,
      ratingCount: ratingCount,
      imageFile: imageFile,
      sellingCount: sellingCount,
      isFavorite: isFavorite,
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
      avgRating: json['avgRating'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      sellingCount: json['sellingCount'] ?? 0,
      isFavorite: json['isFavorite'] ?? false,
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
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'sellingCount': sellingCount,
      'isFavorite': isFavorite,
    };
  }
}
