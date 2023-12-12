part of 'entities.dart';

class Coupon extends Equatable {
  const Coupon({
    this.expireDateText,
    this.image,
    this.couponCode,
    this.discountName,
    this.discountDescription,
    this.sortLabel,
    this.isAppliedCoupon = false,
    this.expiredDate,
    this.fromDate,
    this.toDate,
    this.isAvailable = false,
    this.promotionInfo,
    this.promotionType,
    this.ruleId,
    this.usedDate,
    this.limit,
    this.totalUsed,
    this.excluded = false,
    this.tnc,
    this.tncUrl,
    this.isKeyInCoupon = false,
  });

  final String? expireDateText;
  final String? image;
  final String? couponCode;
  final String? discountName;
  final String? tnc;
  final String? discountDescription;
  final String? sortLabel;
  final bool isAppliedCoupon;
  final DateTime? expiredDate;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? promotionType;
  final int? ruleId;
  final bool isAvailable;
  final PromotionInfo? promotionInfo;
  final DateTime? usedDate;
  final int? limit;
  final int? totalUsed;
  final bool excluded;
  final String? tncUrl;
  final bool isKeyInCoupon;

  bool get isApplicable =>
      //
      !excluded &&
      isAvailable &&
      (expiredDate == null || expiredDate!.toLocal().isAfter(DateTime.now())) &&
      limit != null &&
      (limit == 0 || (limit! > 0 && limit! > (totalUsed ?? 0)));

  factory Coupon.fromJson(Map<String, dynamic> json) {
    //
    final expAt = DynamicParser.parseInt(json['expire_date']) ?? 0.0;
    final expDate = expAt == 0 ? null : DynamicParser.parseDate(expAt);
    //
    final limit = DynamicParser.parseInt(json['limit']);
    final totalUsed = DynamicParser.parseInt(json['total_used']) ?? 0;
    final isAvailable = json['is_available'] == true;
    //
    return Coupon(
      expireDateText: json["expire_date_text"],
      image: json["image"],
      couponCode: json["coupon_code"],
      discountName: json["discount_name"],
      tnc: json["term_and_condition"],
      discountDescription: json["discount_description"],
      sortLabel: json["sort_label"],
      isAppliedCoupon: json['is_applied_coupon'] == 1,
      expiredDate: expDate,
      fromDate: DynamicParser.parseDate(json['from_date']),
      toDate: DynamicParser.parseDate(json['to_date']),
      isAvailable: isAvailable,
      promotionInfo: json['promotion_info'] == null
          ? null
          : PromotionInfo.fromJson(
              json['promotion_info'],
              ruleId: DynamicParser.parseInt(json['rule_id']),
            ),
      promotionType: json['promotion_type'],
      ruleId: DynamicParser.parseInt(json['rule_id']),
      usedDate: DynamicParser.parseDate(json['used_date']),
      limit: limit,
      totalUsed: totalUsed,
      tncUrl: json['term_and_condition_url'],
      isKeyInCoupon: json['is_key_in_coupon'] == true,
    );
  }

  bool get isExpired => expiredDate == null
      ? false
      : expiredDate!.toLocal().isBefore(DateTime.now());

  @override
  List<Object?> get props {
    return [
      expireDateText,
      image,
      couponCode,
      discountName,
      tnc,
      discountDescription,
      sortLabel,
      isAppliedCoupon,
      expiredDate,
      promotionInfo,
      promotionType,
      ruleId,
      fromDate,
      toDate,
      usedDate,
      limit,
      totalUsed,
      isAvailable,
      tncUrl,
      isKeyInCoupon,
    ];
  }

  Coupon copyWith({
    String? expireDateText,
    String? image,
    String? couponCode,
    String? discountName,
    String? tnc,
    String? discountDescription,
    String? sortLabel,
    bool? isAppliedCoupon,
    DateTime? expiredDate,
    PromotionInfo? promotionInfo,
    String? promotionType,
    int? ruleId,
    DateTime? fromDate,
    DateTime? toDate,
    DateTime? usedDate,
    int? limit,
    int? totalUsed,
    bool? isAvailable,
    bool? excluded,
    String? tncUrl,
    bool? isKeyInCoupon,
  }) {
    return Coupon(
      expireDateText: expireDateText ?? this.expireDateText,
      image: image ?? this.image,
      couponCode: couponCode ?? this.couponCode,
      discountName: discountName ?? this.discountName,
      tnc: tnc ?? this.tnc,
      discountDescription: discountDescription ?? this.discountDescription,
      sortLabel: sortLabel ?? this.sortLabel,
      isAppliedCoupon: isAppliedCoupon ?? this.isAppliedCoupon,
      expiredDate: expiredDate ?? this.expiredDate,
      promotionInfo: promotionInfo ?? this.promotionInfo,
      promotionType: promotionType ?? this.promotionType,
      ruleId: ruleId ?? this.ruleId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      usedDate: usedDate ?? this.usedDate,
      limit: limit ?? this.limit,
      totalUsed: totalUsed ?? this.totalUsed,
      isAvailable: isAvailable ?? this.isAvailable,
      excluded: excluded ?? this.excluded,
      tncUrl: tncUrl ?? this.tncUrl,
      isKeyInCoupon: isKeyInCoupon ?? this.isKeyInCoupon,
    );
  }
}

class PromotionInfo extends Equatable {
  final List<PromotionItem> gifts;
  final List<PromotionContitionGroup> conditionGroups;

  const PromotionInfo({
    this.gifts = const [],
    this.conditionGroups = const [],
  });

  factory PromotionInfo.fromJson(Map<String, dynamic> json, {int? ruleId}) =>
      PromotionInfo(
        gifts: json['gifts'] == null
            ? []
            : (json['gifts'] as List)
                .map((e) => PromotionItem.fromJson(e))
                .map((e) => e.copyWith(ruleId: ruleId))
                .toList(),
        conditionGroups: json['condition_groups'] == null
            ? []
            : (json['condition_groups'] as List)
                .map((e) => PromotionContitionGroup.fromJson(e))
                .toList(),
      );

  List<String> getAllSkus() {
    return ([
      ...gifts.map((e) => e.sku ?? ''),
      ...conditionGroups
          .expand((e) => e.conditionItems)
          .map((e) => e.sku ?? ''),
    ]).toSet().toList();
  }

  @override
  List<Object?> get props => [
        gifts,
        conditionGroups,
      ];

  PromotionInfo copyWith({
    List<PromotionItem>? gifts,
    List<PromotionContitionGroup>? conditionGroups,
  }) {
    return PromotionInfo(
      gifts: gifts ?? this.gifts,
      conditionGroups: conditionGroups ?? this.conditionGroups,
    );
  }
}

class PromotionContitionGroup extends Equatable {
  final List<PromotionItem> conditionItems;
  final String? title;
  final double? amount;
  final int? quantity;

  const PromotionContitionGroup({
    this.conditionItems = const [],
    this.title,
    this.amount,
    this.quantity,
  });

  factory PromotionContitionGroup.fromJson(Map<String, dynamic> json) =>
      PromotionContitionGroup(
        amount: DynamicParser.parseDouble(json['amount']),
        quantity: DynamicParser.parseInt(json['quantity']),
        title: json['title'],
        conditionItems: json['conditions'] == null
            ? []
            : (json['conditions'] as List)
                .map((e) => PromotionItem.fromJson(e))
                .toList(),
      );

  @override
  List<Object?> get props => [
        conditionItems,
        title,
        amount,
        quantity,
      ];

  PromotionContitionGroup copyWith({
    List<PromotionItem>? conditionItems,
    String? title,
    double? amount,
    int? quantity,
  }) {
    return PromotionContitionGroup(
      conditionItems: conditionItems ?? this.conditionItems,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      quantity: quantity ?? this.quantity,
    );
  }
}

class PromotionItem extends Equatable {
  final String? sku;
  final double? amount;
  final int? quantity;
  final int? limit;
  final bool isSelected;
  final int? ruleId;
  final Product? product;

  const PromotionItem({
    this.sku,
    this.amount,
    this.quantity,
    this.limit,
    this.isSelected = false,
    this.ruleId,
    this.product,
  });

  int? get maxQty => limit == null
      ? quantity ?? 1
      : limit == 0
          ? (0x7fffffffffffffff)
          : limit!;

  factory PromotionItem.fromJson(Map<String, dynamic> json) => PromotionItem(
      quantity: DynamicParser.parseInt(json['quantity']),
      amount: DynamicParser.parseDouble(json['amount']),
      sku: json['sku'],
      limit: DynamicParser.parseInt(json['limit']),
      isSelected: json['is_selected'] ?? false);

  @override
  List<Object?> get props => [
        sku,
        amount,
        quantity,
        limit,
        isSelected,
        ruleId,
        product,
      ];

  PromotionItem copyWith({
    String? sku,
    double? amount,
    int? quantity,
    int? limit,
    bool? isSelected,
    int? ruleId,
    Product? product,
  }) {
    return PromotionItem(
      sku: sku ?? this.sku,
      amount: amount ?? this.amount,
      quantity: quantity ?? this.quantity,
      limit: limit ?? this.limit,
      isSelected: isSelected ?? this.isSelected,
      ruleId: ruleId ?? this.ruleId,
      product: product ?? this.product,
    );
  }
}
