import 'package:equatable/equatable.dart';
import 'package:fruit_hub_market/features/product/domain/entities/product_entity.dart';
import 'package:fruit_hub_market/features/offers/domain/entities/offer_entity.dart';

class ProductWithOfferEntity extends Equatable {
  final ProductEntity product;
  final OfferEntity? offer;

  const ProductWithOfferEntity({
    required this.product,
    this.offer,
  });

  // =========================
  // BASIC HELPERS
  // =========================

  bool get hasOffer => offer != null;

  bool get isOnDiscount =>
      hasOffer && (offer!.discountPercentage > 0);

  // =========================
  // PRICES
  // =========================

  double get currentPrice =>
      offer?.priceAfterDiscount ?? product.price.toDouble();

  double get oldPrice =>
      product.price.toDouble();

  double get discountAmount {
    if (!hasOffer) return 0;
    return oldPrice - currentPrice;
  }

  // =========================
  // DISCOUNT INFO
  // =========================

  double get discountPercentage {
    if (!hasOffer) return 0;

    if (offer!.discountPercentage > 0) {
      return offer!.discountPercentage;
    }

    // fallback calculation
    if (oldPrice == 0) return 0;

    return ((oldPrice - currentPrice) / oldPrice) * 100;
  }

  String get discountLabel {
    if (!hasOffer) return '';
    return '${discountPercentage.toStringAsFixed(0)}% OFF';
  }

  // =========================
  // UI HELPERS
  // =========================

  String get priceLabel =>
      '${currentPrice.toStringAsFixed(2)} جنيه';

  String get oldPriceLabel =>
      '${oldPrice.toStringAsFixed(2)} جنيه';

  bool get showOldPrice => hasOffer;

  // =========================
  // OFFER STATUS (future-proof)
  // =========================

  bool get isActiveOffer {
    if (!hasOffer) return false;

    final now = DateTime.now();

    return !offer!.startDate.isAfter(now) &&
        !offer!.endDate.isBefore(now);
  }

  // =========================
  // EQUATABLE
  // =========================

  @override
  List<Object?> get props => [product, offer];
}