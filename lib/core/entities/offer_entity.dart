import 'package:equatable/equatable.dart';

class OfferEntity extends Equatable {
  final String productId;
  final String image;
  final String name;
  final double priceBeforeDiscount;
  final double priceAfterDiscount;
  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;

  const OfferEntity({
    required this.productId,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.name,
    required this.priceBeforeDiscount,
    required this.priceAfterDiscount,
  });
  /// هل العرض شغال حاليًا؟
  bool get isActive {
    final now = DateTime.now().toUtc();

    final start = DateTime.utc(startDate.year, startDate.month, startDate.day);
    final end = DateTime.utc(endDate.year, endDate.month, endDate.day + 1);

    return now.isAfter(start) && now.isBefore(end);
  }
  /// هل العرض انتهى؟
  bool get isExpired {
    return DateTime.now().isAfter(endDate);
  }

  /// هل العرض لسه ما بدأش؟
  bool get isUpcoming {
    return DateTime.now().isBefore(startDate);
  }

  /// عدد الأيام المتبقية
  int get remainingDays {
    return endDate.difference(DateTime.now()).inDays;
  }

  /// قيمة الخصم الفعلية
  double get discountAmount {
    return priceBeforeDiscount - priceAfterDiscount;
  }

  /// نسبة الخصم محسوبة من الأسعار
  double get calculatedDiscountPercentage {
    if (priceBeforeDiscount == 0) return 0;
    return ((priceBeforeDiscount - priceAfterDiscount) /
        priceBeforeDiscount) *
        100;
  }

  @override
  List<Object?> get props => [
    productId,
    discountPercentage,
    startDate,
    endDate,
    image,
    name,
    priceBeforeDiscount,
    priceAfterDiscount,
  ];
}
