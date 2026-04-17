
import '../../domain/entities/product_entity.dart';

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
    super.rating = 0.0,
    super.reviews = 0,
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
      rating: entity.rating,
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
      rating: rating,
      reviews: reviews,
      imageFile: imageFile,
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      price: json['price'],
      description: json['description'],
      imageFile: json['imageFile'],
      isFeatured: json['isFeatured'],
      image: json['image'],
      expirationMonth: json['expirationMonth'],
      unitAmount: json['unitAmount'],
      numberOfCalories: json['numberOfCalories'],
      isOrganic: json['isOrganic'],
      rating: json['rating'],
      reviews: json['reviews'],
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
      'rating': rating,
      'reviews': reviews,
    };
  }
}
