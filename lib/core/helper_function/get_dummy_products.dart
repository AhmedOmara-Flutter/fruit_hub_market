import 'package:fruit_hub_market/core/utils/app_imports.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';

ProductEntity getDummyProduct = ProductEntity(
  name: 'Organic Apple',
  code: '',
  price: 0,
  description: '',
  imageFile: null,
  isFeatured: true,
  image:'https://wplubouwksawibitfhlj.supabase.co/storage/v1/object/public/images/1776777319219_1000288651.jpg',
  expirationMonth: 1,
  unitAmount: 1,
  numberOfCalories: 95,
  isOrganic: true,
  avgRating: 4.5,
  ratingCount: 120,
  sellingCount: 300,
  reviews: [],
);

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
    getDummyProduct,
  ];
}
