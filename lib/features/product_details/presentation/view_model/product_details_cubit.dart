import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruit_hub_market/core/services/database_services.dart';
import 'package:fruit_hub_market/features/product_details/data/models/review_model.dart';

import '../../../../core/helper_function/get_user.dart';
import '../../domain/entities/review_entity.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._databaseServices) : super(ProductDetailsInitial());
  final DatabaseServices _databaseServices;

  TextEditingController reviewController = TextEditingController();

  void updateReviewField(String text) {
   final isTyped = text.trim().isNotEmpty;

    emit(ProductDetailsUpdateReviewField(isTyped:isTyped));
  }

  List<dynamic> reviews = [];

  void addReview(ReviewEntity review, String productId) async {
    // دي خلي بالك عشان لو عدل review مكيعملش واحد تاني بل يعدل علي القديم
    final userId = getUser().uId;

    await _databaseServices.addData(
      path: 'products/$productId/reviews',
      data: ReviewModel.fromEntity(review).toJson(),
      uId: userId,
    );

    await getReviews(productId);
  }

  Future<void> getReviews(String productId) async {
    final data = await _databaseServices.getData(
      path: 'products/$productId/reviews',
    );

    reviews = data.map((e) => ReviewModel.fromJson(e).toEntity()).toList();

    emit(ReviewsLoaded());
  }
}
