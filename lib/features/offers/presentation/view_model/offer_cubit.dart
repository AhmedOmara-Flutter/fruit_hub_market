import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/offer_entity.dart';
import '../../../../core/repos/offer_repo/offer_repo.dart';
part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit(this._offerRepo) : super(OffersInitial());
  final OfferRepo _offerRepo;

  List<OfferEntity> offers = [];
  Map<String, OfferEntity> offersMap = {};
  StreamSubscription ?_offerStreamSubscription;


  void getOffers() {
    emit(GetOffersLoading());
    _offerStreamSubscription = _offerRepo.getOffers().listen((result) {
      result.fold(
            (failure) {
          print("❌ OFFER FAILURE: ${failure.errMessage}");
          emit(GetOffersFailure(failure.errMessage));
        },
            (offers) {

          print("🔥 OFFERS RECEIVED: ${offers.length}");

          this.offers = offers;

          offersMap = {};

          for (var offer in offers) {
            print("🟡 OFFER LOOP:");
            print("productId: ${offer.productId}");
            print("isActive: ${offer.isActive}");

            offersMap[offer.productId] = offer;
          }

          print("🧠 FINAL MAP KEYS:");
          print(offersMap.keys.toList());

          if (offers.isEmpty) {
            print("⚠️ NO OFFERS FOUND");
            emit(GetOffersEmpty());
          } else {
            print("✅ EMIT SUCCESS");
            emit(GetOffersSuccess(offers, offersMap));
          }
        },
      );
    });  }

  Future<void> deleteOffer(String offerId) async {
    emit(DeleteOfferLoading());
    final result = await _offerRepo.deleteOffer(offerId);
    await result.fold(
      (failure) async {
        emit(DeleteOfferFailure(failure.errMessage));
      },
      (success) async {
        emit(DeleteOfferSuccess());
      },
    );
  }

  void resetState() {
    emit(OffersInitial());
  }

  @override
  Future<void> close() {
    _offerStreamSubscription?.cancel();
    return super.close();
  }
}
