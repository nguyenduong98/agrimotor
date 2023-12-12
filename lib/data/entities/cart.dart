part of 'entities.dart';

class CartItem extends Equatable {
  final int? itemId;
  final String? sku;
  final int? qty;
  final String? name;
  final double? price;
  final String? productType;
  final int? quoteId;
  final CartItemExtensionAttr? extAttrs;

  const CartItem({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
    this.extAttrs,
  });

  factory CartItem.fromJson(Map<String, dynamic> map) {
    return CartItem(
      itemId: DynamicParser.parseInt(map['item_id']),
      sku: map['sku'],
      qty: DynamicParser.parseInt(map['qty']),
      name: map['name'],
      price: DynamicParser.parseDouble(map['price']),
      productType: map['product_type'],
      quoteId: DynamicParser.parseInt(map['quote_id']),
      extAttrs: map['extension_attributes'] != null
          ? CartItemExtensionAttr.fromJson(map['extension_attributes'])
          : null,
    );
  }

  @override
  List<Object?> get props {
    return [
      itemId,
      sku,
      qty,
      name,
      price,
      productType,
      quoteId,
      extAttrs,
    ];
  }
}

class CartItemExtensionAttr extends Equatable {
  final bool? alwaysInCart;
  final bool? isReadyCheckout;
  final bool isFreeGift;
  final bool isBestOffer;
  final bool isOutOfStock;
  final int? quoteLaterItemId;
  final double? shippingFee;
  final int? qtyAvailable;
  final String? thumbnail;
  final String? sku;
  final double? originalPrice;
  final String? discountPercent;
  final String? productNote;
  final String? variantName;
  final CartItemPromotionInfo? promotionInfo;
  final List<CartProductOption>? bundleComboOptions;
  final List<CartProductOption>? bundleOptions;
  final List<CartProductOption>? configurableOptions;
  final List<String>? productsSubstitute;
  final int? idProduct;
  final String? ruleName;
  final int? dailyLimitByUser;
  final int? dailyLimitByCart;

  const CartItemExtensionAttr({
    this.alwaysInCart,
    this.isReadyCheckout,
    this.isFreeGift = false,
    this.isOutOfStock = false,
    this.isBestOffer = false,
    this.quoteLaterItemId,
    this.shippingFee,
    this.qtyAvailable,
    this.thumbnail,
    this.sku,
    this.originalPrice,
    this.discountPercent,
    this.productNote,
    this.variantName,
    this.promotionInfo,
    this.bundleComboOptions,
    this.bundleOptions,
    this.configurableOptions,
    this.productsSubstitute,
    this.idProduct,
    this.ruleName,
    this.dailyLimitByCart,
    this.dailyLimitByUser,
  });

  factory CartItemExtensionAttr.fromJson(Map<String, dynamic> map) {
    return CartItemExtensionAttr(
      alwaysInCart: map['always_in_cart'] == 1,
      isReadyCheckout: map['is_ready_checkout'] == 1,
      isFreeGift: map['is_free_gift'] == 1,
      isBestOffer: map['is_best_offer'] == 1,
      isOutOfStock: map['is_out_of_stock'] == 1,
      quoteLaterItemId: DynamicParser.parseInt(map['quote_later_item_id']),
      shippingFee: DynamicParser.parseDouble(map['shipping_fee']),
      qtyAvailable: DynamicParser.parseInt(map['qty_available']),
      thumbnail: map['thumbnail'],
      sku: map['sku'],
      productNote: map['product_note'],
      variantName: map['variant_name'],
      originalPrice: DynamicParser.parseDouble(map['original_price']),
      discountPercent: map['discount_percent'],
      productsSubstitute: map['products_substitute']?.cast<String>(),
      bundleComboOptions: map['bundle_combo_options'] != null
          ? (map['bundle_combo_options'] as List)
              .map((e) => CartProductOption.fromJson(e))
              .toList()
          : null,
      bundleOptions: map['bundle_options'] != null
          ? (map['bundle_options'] as List)
              .map((e) => CartProductOption.fromJson(e))
              .toList()
          : null,
      configurableOptions: map['configurable_options'] != null
          ? (map['configurable_options'] as List)
              .map((e) => CartProductOption.fromJson(e))
              .toList()
          : null,
      promotionInfo: map['promotion_information'] != null
          ? CartItemPromotionInfo.fromJson(map['promotion_information'])
          : null,
      idProduct: DynamicParser.parseInt(map['id_product']),
      ruleName: map['rule_name'],
      dailyLimitByCart: DynamicParser.parseInt(map['daily_limit_by_cart']),
      dailyLimitByUser: DynamicParser.parseInt(map['daily_limit_by_user']),
    );
  }

  @override
  List<Object?> get props {
    return [
      alwaysInCart,
      isReadyCheckout,
      isFreeGift,
      isBestOffer,
      isOutOfStock,
      quoteLaterItemId,
      shippingFee,
      qtyAvailable,
      thumbnail,
      sku,
      productNote,
      variantName,
      originalPrice,
      discountPercent,
      bundleComboOptions,
      bundleOptions,
      configurableOptions,
      productsSubstitute,
      promotionInfo,
      idProduct,
      ruleName,
      dailyLimitByCart,
      dailyLimitByUser,
    ];
  }

  CartItemExtensionAttr copyWith({
    bool? alwaysInCart,
    bool? isReadyCheckout,
    bool? isFreeGift,
    bool? isBestOffer,
    bool? isOutOfStock,
    int? quoteLaterItemId,
    double? shippingFee,
    int? qtyAvailable,
    String? thumbnail,
    String? sku,
    double? originalPrice,
    String? discountPercent,
    String? productNote,
    String? variantName,
    CartItemPromotionInfo? promotionInfo,
    List<CartProductOption>? bundleComboOptions,
    List<CartProductOption>? bundleOptions,
    List<CartProductOption>? configurableOptions,
    List<String>? productsSubstitute,
    int? idProduct,
    String? ruleName,
    int? dailyLimitByUser,
    int? dailyLimitByCart,
  }) {
    return CartItemExtensionAttr(
      alwaysInCart: alwaysInCart ?? this.alwaysInCart,
      isReadyCheckout: isReadyCheckout ?? this.isReadyCheckout,
      isFreeGift: isFreeGift ?? this.isFreeGift,
      isBestOffer: isBestOffer ?? this.isBestOffer,
      isOutOfStock: isOutOfStock ?? this.isOutOfStock,
      quoteLaterItemId: quoteLaterItemId ?? this.quoteLaterItemId,
      shippingFee: shippingFee ?? this.shippingFee,
      qtyAvailable: qtyAvailable ?? this.qtyAvailable,
      thumbnail: thumbnail ?? this.thumbnail,
      sku: sku ?? this.sku,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      productNote: productNote ?? this.productNote,
      variantName: variantName ?? this.variantName,
      promotionInfo: promotionInfo ?? this.promotionInfo,
      bundleComboOptions: bundleComboOptions ?? this.bundleComboOptions,
      bundleOptions: bundleOptions ?? this.bundleOptions,
      configurableOptions: configurableOptions ?? this.configurableOptions,
      productsSubstitute: productsSubstitute ?? this.productsSubstitute,
      idProduct: idProduct ?? this.idProduct,
      ruleName: ruleName ?? this.ruleName,
      dailyLimitByUser: dailyLimitByUser ?? this.dailyLimitByUser,
      dailyLimitByCart: dailyLimitByCart ?? this.dailyLimitByCart,
    );
  }
}

class CartProductOption extends Equatable {
  const CartProductOption({
    this.optionId,
    this.optionQty,
    this.optionValue,
    this.optionSelections,
    this.thumbnail,
    this.title,
    this.price,
  });

  final int? optionId;
  final int? optionQty;
  final int? optionValue;
  final List<int>? optionSelections;
  final String? title;
  final String? thumbnail;
  final double? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (optionId != null) map['option_id'] = optionId;
    if (optionValue != null) map['option_value'] = optionValue;
    if (optionQty != null) map['option_qty'] = optionQty;
    if (optionSelections != null) map['option_selections'] = optionSelections;
    return map;
  }

  factory CartProductOption.fromJson(Map<String, dynamic> json) {
    return CartProductOption(
      optionId: DynamicParser.parseInt(json['option_id']),
      optionQty: DynamicParser.parseInt(json['option_qty']),
      optionValue: DynamicParser.parseInt(json['option_value']),
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: DynamicParser.parseDouble(json['price']),
      optionSelections: json['option_selections'] != null
          ? (json['option_selections'] as List)
              .map((e) => DynamicParser.parseInt(e))
              .toList()
              .cast<int>()
          : null,
    );
  }

  @override
  List<Object?> get props => [
        optionId,
        optionQty,
        optionValue,
        optionSelections,
        thumbnail,
        title,
        price,
      ];
}

class CartItemPromotionInfo extends Equatable {
  final String? ruleName;
  final String? sku;
  final int? ruleId;
  final bool isApplied;
  final String? promotionType;
  final int? quantity;

  const CartItemPromotionInfo({
    this.ruleName,
    this.sku,
    this.ruleId,
    this.isApplied = false,
    this.promotionType,
    this.quantity,
  });

  factory CartItemPromotionInfo.fromJson(Map<String, dynamic> map) {
    return CartItemPromotionInfo(
      ruleName: map['rule_name'],
      sku: map['product_sku'],
      ruleId: DynamicParser.parseInt(map['rule_id']),
      isApplied: map['is_applied'] == true,
      promotionType: map['promotion_type'],
      quantity: DynamicParser.parseInt(map['quantity']),
    );
  }

  @override
  List<Object?> get props => [
        ruleName,
        sku,
        ruleId,
        isApplied,
        promotionType,
        quantity,
      ];
}
