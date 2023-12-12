// ignore_for_file: constant_identifier_names

part of 'entities.dart';

enum ReviewSort { latest, highRating, lowRating }

class PromotionType {
  PromotionType._();

  static const buyNPlus1 = 'product_base_n1';
  static const buyXGetY = 'product_base_buyxgety';
  static const productBasePoint = 'product_base_point';
  static const productBaseCombo = 'product_base_combo';
  //
  static const baseFreeGift = 'product_base_freegift';
  static const baseFreeGiftSelect = 'product_base_freegift_selection';
  static const baseFreeGiftCoupon = 'product_base_freegift_coupon';
  static const baseFreeGiftEVoucher = 'product_base_freegift_evoucher';
  static const baseFreeGiftBrandSponsor = 'product_base_freegift_brandsponsor';
  static const baseFreeGiftEBoucherBrandSponsor =
      'product_base_freegift_evoucher_brandsponsor';
}

class ProductSortParams {
  ProductSortParams._();

  static const byProductName = 'name.keyword';
  static const byPriceDefault = 'price_default';
  static const byMostSold = 'score_card';
  static const byMostViewed = 'ext_viewed';
  static const byHighestDiscountRate = 'price_discount_percent';
}

class SortType {
  SortType._();

  static const asc = 'asc';
  static const desc = 'desc';
}

class StockFilter {
  StockFilter._();

  static const all = '';
  static const available = '1';
  static const outOfStock = '0';
}

enum ProductUnit {
  Kg,
  EA,
}

enum PopupNotice {
  wine_popup,
  milk_popup,
  //suppplement_popup,
}

class Product extends Equatable {
  //
  static const simple = 'simple';
  static const bundle = 'bundle';
  static const configurable = 'configurable';

  static const _bundleType = 'Bundle';
  static const _comboType = 'Combo';

  const Product({
    this.categoryFullPath,
    this.categoryPath,
    this.categories,
    this.searchCategoriesIds,
    this.configurableOptions,
    this.configurableChildren,
    this.bundleOptions,
    this.objectId,
    this.id,
    this.attributeSetId,
    this.sku,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.name,
    this.url,
    this.urlKey,
    this.visibilitySearch,
    this.visibilityCatalog,
    this.typeId,
    this.description,
    this.shortDescription,
    this.price,
    this.childPrice,
    this.imageUrl,
    this.stockQty = 0,
    this.inStock = false,
    this.maxSaleQty,
    this.minSaleQty,
    this.childStock,
    this.specialAttributes,
    this.customAttribute,
    this.bigMedia,
    this.extOverallRating,
    this.extViewed,
    this.coupons,
    this.promotions,
    this.wishlistItemId,
    this.isInWishList = false,
    this.isInWaitList = false,
    this.extOverallReview,
    this.labels,
    this.relatedProducts,
    this.crossSellProducts,
    this.upSellProducts,
    this.latestOrderDate,
    this.qtyOrdered,
  });

  final List<String>? categoryFullPath;
  final List<String>? categoryPath;
  final dynamic categories;
  final dynamic searchCategoriesIds;
  final List<BundleOption>? bundleOptions;
  final int? objectId;
  final int? id;
  final int? attributeSetId;
  final String? sku;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final String? name;
  final String? url;
  final String? urlKey;
  final bool? visibilitySearch;
  final bool? visibilityCatalog;
  final String? typeId;
  final String? description;
  final String? shortDescription;
  final Price? price;
  final List<ChildPrice>? childPrice;
  final String? imageUrl;
  final int stockQty;
  final bool inStock;
  final int? maxSaleQty;
  final int? minSaleQty;
  final List<ChildStock>? childStock;
  final List<SpecialAttribute>? specialAttributes;
  final CustomAttribute? customAttribute;
  final List<String>? bigMedia;
  final List<ConfigurableOption>? configurableOptions;
  final List<ConfigurableChild>? configurableChildren;
  final int? wishlistItemId;
  final bool isInWishList;
  final bool isInWaitList;
  final double? extOverallRating;
  final int? extViewed;
  final int? extOverallReview;
  final List<Coupon>? coupons;
  final List<Coupon>? promotions;
  final List<Label>? labels;
  final List<Product>? relatedProducts;
  final List<Product>? crossSellProducts;
  final List<Product>? upSellProducts;
  final DateTime? latestOrderDate;
  final int? qtyOrdered;

  Product copyWith({
    List<String>? categoryFullPath,
    List<String>? categoryPath,
    dynamic categories,
    dynamic searchCategoriesIds,
    List<BundleOption>? bundleOptions,
    int? objectId,
    int? id,
    int? attributeSetId,
    String? sku,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? status,
    String? name,
    String? url,
    String? urlKey,
    bool? visibilitySearch,
    bool? visibilityCatalog,
    String? typeId,
    String? description,
    String? shortDescription,
    Price? price,
    List<ChildPrice>? childPrice,
    String? imageUrl,
    MediaGallery? mediaGallery,
    MediaGallery? mediaGalleryVideo,
    int? stockQty,
    bool? inStock,
    int? maxSaleQty,
    int? minSaleQty,
    List<ChildStock>? childStock,
    CustomAttribute? customAttribute,
    List<SpecialAttribute>? specialAttributes,
    List<String>? bigMedia,
    List<Coupon>? coupons,
    List<Coupon>? promotions,
    List<ConfigurableOption>? configurableOptions,
    List<ConfigurableChild>? configurableChildren,
    int? wishlistItemId,
    bool? isInWishList,
    bool? isInWaitList,
    double? extOverallRating,
    int? extOverallReview,
    int? extViewed,
    List<Label>? labels,
    List<Product>? relatedProducts,
    List<Product>? crossSellProducts,
    List<Product>? upSellProducts,
    final DateTime? latestOrderDate,
    final int? qtyOrdered,
  }) {
    return Product(
      categoryFullPath: categoryFullPath ?? this.categoryFullPath,
      categoryPath: categoryPath ?? this.categoryPath,
      categories: categories ?? this.categories,
      searchCategoriesIds: searchCategoriesIds ?? this.searchCategoriesIds,
      bundleOptions: bundleOptions ?? this.bundleOptions,
      objectId: objectId ?? this.objectId,
      id: id ?? this.id,
      attributeSetId: attributeSetId ?? this.attributeSetId,
      sku: sku ?? this.sku,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      name: name ?? this.name,
      url: url ?? this.url,
      urlKey: urlKey ?? this.urlKey,
      visibilitySearch: visibilitySearch ?? this.visibilitySearch,
      visibilityCatalog: visibilityCatalog ?? this.visibilityCatalog,
      typeId: typeId ?? this.typeId,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      price: price ?? this.price,
      childPrice: childPrice ?? this.childPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      stockQty: stockQty ?? this.stockQty,
      inStock: inStock ?? this.inStock,
      maxSaleQty: maxSaleQty ?? this.maxSaleQty,
      minSaleQty: minSaleQty ?? this.minSaleQty,
      childStock: childStock ?? this.childStock,
      customAttribute: customAttribute ?? this.customAttribute,
      specialAttributes: specialAttributes ?? this.specialAttributes,
      bigMedia: bigMedia ?? this.bigMedia,
      coupons: coupons ?? this.coupons,
      promotions: promotions ?? this.promotions,
      configurableOptions: configurableOptions ?? this.configurableOptions,
      configurableChildren: configurableChildren ?? this.configurableChildren,
      wishlistItemId: wishlistItemId ?? this.wishlistItemId,
      isInWishList: isInWishList ?? this.isInWishList,
      isInWaitList: isInWaitList ?? this.isInWaitList,
      extOverallRating: extOverallRating ?? this.extOverallRating,
      extOverallReview: extOverallReview ?? this.extOverallReview,
      extViewed: extViewed ?? this.extViewed,
      labels: labels ?? this.labels,
      relatedProducts: relatedProducts ?? this.relatedProducts,
      crossSellProducts: crossSellProducts ?? this.crossSellProducts,
      upSellProducts: upSellProducts ?? this.upSellProducts,
      latestOrderDate: latestOrderDate ?? this.latestOrderDate,
      qtyOrdered: qtyOrdered ?? this.qtyOrdered,
    );
  }

  String? get unit => customAttribute?.unit;
  bool get isSimpleProduct => typeId == Product.simple || typeId == null;
  bool get isConfigurableProduct => typeId == Product.configurable;
  bool get isBundleProduct =>
      typeId == Product.bundle && customAttribute?.bundleType == _bundleType;
  bool get isComboProduct =>
      typeId == Product.bundle && customAttribute?.bundleType == _comboType;

  Label? get categoryFirstLabel => getValidCategoryLabel(0);
  Label? get categorySecondLabel => getValidCategoryLabel(1);
  Label? get categoryThirdLabel => getValidCategoryLabel(2);
  Label? get categotyFourthLabel => getValidCategoryLabel(3);
  Label? get productDetailFirstLabel => getValidProductDetailLabel(0);
  Label? get productDetailSecondLabel => getValidProductDetailLabel(1);
  Label? get productDetailThirdLabel => getValidProductDetailLabel(2);
  Label? get productDetailFourthLabel => getValidProductDetailLabel(3);

  Label? getValidProductDetailLabel(int index) {
    return labels?.where((e) => e.productPosition == index).firstOrNull;
  }

  Label? getValidCategoryLabel(int index) {
    return labels?.where((e) => e.categoryPosition == index).firstOrNull;
  }

  double getPriceByQuantity(int quantity) {
    //
    if (!isBundleProduct) return price!.priceDefault ?? 0.0;
    //
    if (childPrice?.isEmpty ?? false) return price!.priceDefault ?? 0.0;
    //
    final vndPrice = childPrice!.first.price;
    if (vndPrice == null) return 0.0;
    return vndPrice.tierPrices?.values
            .toList()
            .lastWhereOrNull((e) => (e.qty ?? 0) <= quantity)
            ?.value ??
        0.0;
  }

  TierPrice? getTierPriceByQuantity(int quantity) {
    return childPrice?.first.price?.tierPrices?.values
        .lastWhereOrNull((e) => (e.qty ?? 0) <= quantity);
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    //
    final stock = DynamicParser.parseInt(json["stock_qty"]) ?? 0;
    return Product(
      categoryFullPath: json["category_full_path"]?.cast<String>(),
      categoryPath: json["category_path"]?.cast<String>(),
      categories: json["categories"],
      searchCategoriesIds: json["search_categories_ids"],
      configurableOptions: json["configurable_options"] != null
          ? (json["configurable_options"] as List)
              .map((e) => ConfigurableOption.fromJson(e))
              .toList()
          : null,
      configurableChildren: json["configurable_children"] != null
          ? (json["configurable_children"] as List)
              .map((e) => ConfigurableChild.fromJson(e))
              .toList()
          : null,
      bundleOptions: json["bundle_options"] == null
          ? null
          : (json["bundle_options"] as Map)
              .values
              .map((e) => BundleOption.fromJson(e))
              .toList(),
      objectId: json["object_id"],
      id: DynamicParser.parseInt(json["id"]),
      attributeSetId: json["attribute_set_id"],
      sku: json["sku"],
      createdAt: DynamicParser.parseDate(json["created_at"]),
      updatedAt: DynamicParser.parseDate(json["updated_at"]),
      status: json["status"],
      name: json["name"],
      url: json["url"],
      urlKey: json["url_key"],
      visibilitySearch: json["visibility_search"],
      visibilityCatalog: json["visibility_catalog"],
      typeId: json["type_id"],
      description: json["description"],
      shortDescription: json["short_description"],
      price: json["price"]?['VND'] != null
          ? Price.fromJson(json['price']['VND'])
          : null,
      childPrice: json["child_price"] == null
          ? null
          : (json["child_price"] as List)
              .map((e) => ChildPrice.fromJson(e))
              .toList(),
      imageUrl: json["image_url"],
      stockQty: stock <= 0 ? 0 : stock,
      inStock: DynamicParser.parseInt(json["in_stock"]) == 1,
      maxSaleQty: json["max_sale_qty"],
      minSaleQty: json["min_sale_qty"],
      childStock: json["child_stock"] == null
          ? []
          : (json['child_stock'] as List)
              .map((e) => ChildStock.fromJson(e))
              .toList(),
      specialAttributes: json["special_attributes"] == null
          ? null
          : (json["special_attributes"] as List)
              .map((e) => SpecialAttribute.fromJson(e))
              .toList(),
      customAttribute: json["custom_attribute"] == null
          ? null
          : CustomAttribute.fromJson(json["custom_attribute"]),
      bigMedia: [
        if (json["media_gallery_video"] != null)
          ...(json["media_gallery_video"] as List)
              .map((e) => e['video_url'])
              .where((e) => e != null)
              .cast<String>(),
        if (json["media_gallery"] != null)
          ...MediaGallery.fromJson(json["media_gallery"]).big ?? <String>[],
      ],
      extOverallRating: DynamicParser.parseDouble(json["ext_overall_rating"]),
      extViewed: json["ext_viewed"],
      coupons: json["coupons"] != null
          ? (json["coupons"] as List).map((e) => Coupon.fromJson(e)).toList()
          : null,
      promotions: json["promotion"] != null
          ? (json["promotion"] as List)
              .map((e) => Coupon.fromJson(e))
              .where(
                (e) =>
                    e.promotionInfo != null &&
                    (e.discountName?.isNotEmpty ?? false) &&
                    (e.discountDescription?.isNotEmpty ?? false) &&
                    e.expiredDate != null &&
                    !e.isExpired,
              )
              .toList()
          : null,
      wishlistItemId: DynamicParser.parseInt(json["wishlist_item_id"]),
      extOverallReview: DynamicParser.parseInt(json['ext_overall_review']),
      labels: json['label'] == null
          ? null
          : (json['label'] as List).map((e) => Label.fromJson(e)).toList(),
      relatedProducts: json["related_products"] == null
          ? null
          : (json["related_products"] as List)
              .map((e) => Product.fromJson(e))
              .toList(),
      crossSellProducts: json["cross_sell_products"] == null
          ? null
          : (json["cross_sell_products"] as List)
              .map((e) => Product.fromJson(e))
              .toList(),
      upSellProducts: json["up_sell_products"] == null
          ? null
          : (json["up_sell_products"] as List)
              .map((e) => Product.fromJson(e))
              .toList(),
      latestOrderDate: DynamicParser.parseDate(json["latest_order_date"]),
      qtyOrdered: DynamicParser.parseInt(json["qty_ordered"]),
    );
  }

  @override
  List<Object?> get props => [
        categoryFullPath,
        categoryPath,
        categories,
        searchCategoriesIds,
        configurableOptions,
        configurableChildren,
        bundleOptions,
        objectId,
        id,
        attributeSetId,
        sku,
        createdAt,
        updatedAt,
        status,
        name,
        url,
        urlKey,
        visibilitySearch,
        visibilityCatalog,
        typeId,
        description,
        shortDescription,
        price,
        childPrice,
        imageUrl,
        stockQty,
        inStock,
        maxSaleQty,
        minSaleQty,
        childStock,
        customAttribute,
        bigMedia,
        extOverallRating,
        extViewed,
        coupons,
        promotions,
        extOverallReview,
        labels,
        wishlistItemId,
        isInWishList,
        isInWaitList,
        relatedProducts,
        crossSellProducts,
        upSellProducts,
        latestOrderDate,
        qtyOrdered,
      ];
}

class ChildPrice extends Equatable {
  const ChildPrice({this.id, this.price});

  final int? id;
  final Price? price;

  factory ChildPrice.fromJson(Map<String, dynamic> json) => ChildPrice(
        id: DynamicParser.parseInt(json['id']),
        price: json['VND'] == null ? null : Price.fromJson(json['VND']),
      );

  @override
  List<Object?> get props => [
        id,
        price,
      ];
}

class Price extends Equatable {
  const Price({
    this.tierPrices,
    this.priceDefault,
    this.specialFromDate,
    this.specialToDate,
    this.price,
    this.defaultOriginal,
    this.defaultDiscountLabel,
    this.defaultRange,
    this.defaultRangeOriginal,
  });

  final Map<String, TierPrice>? tierPrices;
  final double? priceDefault;
  final DateTime? specialFromDate;
  final DateTime? specialToDate;
  final double? price;
  final double? defaultOriginal;
  final String? defaultDiscountLabel;
  final List<double>? defaultRange;
  final List<double>? defaultRangeOriginal;

  Price copyWith({
    Map<String, TierPrice>? tierPrices,
    double? priceDefault,
    DateTime? specialFromDate,
    DateTime? specialToDate,
    double? price,
    double? defaultOriginal,
    String? defaultDiscountLabel,
    String? defaultFormated,
    List<double>? defaultRange,
    List<double>? defaultRangeOriginal,
  }) =>
      Price(
        tierPrices: tierPrices ?? this.tierPrices,
        priceDefault: priceDefault ?? this.priceDefault,
        specialFromDate: specialFromDate ?? this.specialFromDate,
        specialToDate: specialToDate ?? this.specialToDate,
        price: price ?? this.price,
        defaultOriginal: defaultOriginal ?? this.defaultOriginal,
        defaultDiscountLabel: defaultDiscountLabel ?? this.defaultDiscountLabel,
        defaultRange: defaultRange ?? this.defaultRange,
        defaultRangeOriginal: defaultRangeOriginal ?? this.defaultRangeOriginal,
      );

  factory Price.fromJson(Map<dynamic, dynamic> json) {
    //
    final specialFrom = DynamicParser.parseDate(json["special_from_date"]);
    final specialTo = DynamicParser.parseDate(json["special_to_date"]);
    final specialPrice = DynamicParser.parseDouble(json['special_price']);
    //
    final tierPrices = json["tier_prices"] != null
        ? (json["tier_prices"] as Map<String, dynamic>).map(
            (k, v) {
              final today = DateTime.now();
              var tierPrice = TierPrice.fromJson(v);
              if (specialPrice != null &&
                  specialFrom != null &&
                  specialTo != null &&
                  today.isAfter(specialFrom) &&
                  today.isBefore(specialTo)) {
                //
                final value = [tierPrice.value, specialPrice]
                    .where((e) => e != null)
                    .cast<double>()
                    .minOrNull;
                final orgPrice = tierPrice.defaultOriginal ?? 0.0;
                final price = (value ?? 0) * (tierPrice.qty ?? 0);
                final discount = (orgPrice == 0.0 || orgPrice == price)
                    ? 0.0
                    : (orgPrice - price) * 100 / orgPrice;

                //
                tierPrice = tierPrice.copyWith(
                  value: value,
                  price: price,
                  defaultDiscountLabel:
                      discount < 10.0 ? null : '-${discount.round()}%',
                );
              }
              return MapEntry(k, tierPrice);
            },
          )
        : null;

    return Price(
      tierPrices: tierPrices,
      priceDefault: DynamicParser.parseDouble(json["default"]),
      specialFromDate: DynamicParser.parseDate(json["special_fromDate"]),
      specialToDate: DynamicParser.parseDate(json["special_to_date"]),
      price: DynamicParser.parseDouble(json["price"]),
      defaultOriginal: DynamicParser.parseDouble(json["default_original"]),
      defaultDiscountLabel: json["default_discount_label"],
      defaultRange: json['default_range'] == null
          ? null
          : (json['default_range'] as List)
              .map((e) => DynamicParser.parseDouble(e))
              .where((e) => e != null)
              .toList()
              .cast<double>()
              .sortedBy<num>((e) => e),
      defaultRangeOriginal: json['default_range_original'] == null
          ? null
          : (json['default_range_original'] as List)
              .map((e) => DynamicParser.parseDouble(e))
              .where((e) => e != null)
              .toList()
              .cast<double>()
              .sortedBy<num>((e) => e),
    );
  }

  @override
  List<Object?> get props => [
        tierPrices,
        priceDefault,
        specialFromDate,
        specialToDate,
        price,
        defaultOriginal,
        defaultDiscountLabel,
        defaultRange,
        defaultRangeOriginal,
      ];

  double? get getFinalPrice => defaultRange?.minOrNull ?? priceDefault;

  double? get getFinalPriceMax => defaultRange?.maxOrNull;

  double? get getPriceBeforeDiscount {
    final price = defaultRangeOriginal?.minOrNull ?? defaultOriginal;
    if (price == null || price == 0) return null;
    if (getFinalPrice == null) return null;
    return price;
  }

  double? get getPriceBeforeDiscountMax {
    final price = defaultRangeOriginal?.maxOrNull;
    if (price == null || price == 0) return null;
    if (getFinalPriceMax == null) return null;
    return price;
  }

  double? get discount => priceDefault != null &&
          defaultOriginal != null &&
          defaultOriginal! > priceDefault!
      ? defaultOriginal! - priceDefault!
      : null;
}

class MediaGallery {
  MediaGallery({
    this.thumb,
    this.big,
  });

  final List<String>? thumb;
  final List<String>? big;

  factory MediaGallery.fromJson(Map<dynamic, dynamic> json) => MediaGallery(
        thumb: (json["thumb"] != null && json["thumb"].isNotEmpty)
            ? Map.from(json["thumb"]!)
                .map((k, v) => MapEntry<String, String>(k, v))
                .values
                .toList()
            : null,
        big: (json["big"] != null && json["big"].isNotEmpty)
            ? Map.from(json["big"]!)
                .map((k, v) => MapEntry<String, String>(k, v))
                .values
                .toList()
            : null,
      );
}

class TierPrice extends Equatable {
  const TierPrice({
    this.customerGroupId,
    this.qty,
    this.value,
    this.defaultDiscountLabel,
    this.defaultOriginal,
    this.price,
  });

  final int? customerGroupId;
  final int? qty;
  final double? value;
  final double? defaultOriginal;
  final String? defaultDiscountLabel;
  final double? price;

  TierPrice copyWith({
    int? customerGroupId,
    int? qty,
    double? value,
    String? valueFormated,
    double? defaultOriginal,
    String? defaultOriginalFormated,
    String? defaultDiscountLabel,
    double? price,
    String? priceFormated,
  }) =>
      TierPrice(
        customerGroupId: customerGroupId ?? this.customerGroupId,
        qty: qty ?? this.qty,
        value: value ?? this.value,
        defaultDiscountLabel: defaultDiscountLabel ?? this.defaultDiscountLabel,
        price: price ?? this.price,
      );

  factory TierPrice.fromJson(Map<String, dynamic> json) => TierPrice(
        customerGroupId: json["customer_group_id"],
        qty: DynamicParser.parseInt(json["qty"]),
        value: DynamicParser.parseDouble(json["value"]),
        defaultOriginal: DynamicParser.parseDouble(json["default_original"]),
        defaultDiscountLabel: json["default_discount_label"],
        price: DynamicParser.parseDouble(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_goup_id": customerGroupId,
        "qty": qty,
        "value": value,
        "default_original": defaultOriginal,
        'default_discount_label': defaultDiscountLabel,
        'price': price,
      };

  double? get finalPrice =>
      defaultDiscountLabel == null || defaultDiscountLabel!.isEmpty
          ? defaultOriginal
          : price;

  double? get getPriceBeforeDiscount =>
      defaultDiscountLabel == null || defaultDiscountLabel!.isEmpty
          ? null
          : defaultOriginal;

  @override
  List<Object?> get props => [
        customerGroupId,
        qty,
        value,
        defaultOriginal,
        defaultDiscountLabel,
        price,
      ];
}

class SpecialAttribute {
  SpecialAttribute({
    this.attributeCode,
    this.value,
    this.label,
  });

  final String? attributeCode;
  final String? value;
  final String? label;

  SpecialAttribute copyWith({
    String? attributeCode,
    String? value,
    String? label,
  }) =>
      SpecialAttribute(
        attributeCode: attributeCode ?? this.attributeCode,
        value: value ?? this.value,
        label: label ?? this.label,
      );

  factory SpecialAttribute.fromJson(Map<String, dynamic> json) =>
      SpecialAttribute(
        attributeCode: json["attribute_code"],
        value: json["value"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "attribute_code": attributeCode,
        "value": value,
        "label": label,
      };
}

class CustomAttribute {
  CustomAttribute({
    this.bundleType,
    this.taxClassId,
    this.limitLabel,
    this.freshLabel,
    this.promoLabel,
    this.saleOffLabel,
    this.disableDisplay,
    this.isWithGift,
    this.isFreeGift,
    this.freshClassification,
    this.freshMeat,
    this.trader,
    this.needIcePack,
    this.nationwideDelivery,
    this.isDietarySupplement,
    this.useDefaultShippingFee,
    this.isBulky,
    this.gmdSource,
    this.discountDisplay,
    this.includeSavingPoint,
    this.displayUom,
    this.allowCodPayment,
    this.enableRma,
    this.dailyLimitByUserFromDate,
    this.dailyLimitByUserToDate,
    this.publishedAt,
    this.volumeMetricsWeight,
    this.volume,
    this.dailyLimitByCart,
    this.dailyLimitByUser,
    this.salesTaxRate,
    this.salesCode,
    this.promoProfitRate,
    this.purchaseTaxRate,
    this.quantity,
    this.sizeHorizontal,
    this.sizeVertical,
    this.sizeHeight,
    this.maxDeliveryDuration,
    this.brandId,
    this.maximumStorageDays,
    this.storeCode,
    this.usageNotes,
    this.brand,
    this.model,
    this.rmaCondition,
    this.storagePrecautions,
    this.usageDuration,
    this.rmaDuration,
    this.unit,
    this.storageCategory,
    this.salesUomUnitOfMeasure,
    this.sizeType,
    this.weightTypeMart,
    this.material,
    this.buyPriceIncTax,
    this.salesPriceExcTax,
    this.shippingFeeAmount,
    this.activity,
    this.styleBags,
    this.strapBags,
    this.featuresBags,
    this.ecoCollection,
    this.performanceFabric,
    this.erinRecommends,
    this.customAttributeNew,
    this.sale,
    this.popupNotice,
  });

  final String? bundleType;
  final String? taxClassId;
  final String? limitLabel;
  final String? freshLabel;
  final String? promoLabel;
  final String? saleOffLabel;
  final String? disableDisplay;
  final String? isWithGift;
  final String? isFreeGift;
  final String? freshClassification;
  final String? freshMeat;
  final String? trader;
  final String? needIcePack;
  final String? nationwideDelivery;
  final String? isDietarySupplement;
  final String? useDefaultShippingFee;
  final String? isBulky;
  final String? gmdSource;
  final String? discountDisplay;
  final String? includeSavingPoint;
  final String? displayUom;
  final String? allowCodPayment;
  final String? enableRma;
  final DateTime? dailyLimitByUserFromDate;
  final DateTime? dailyLimitByUserToDate;
  final DateTime? publishedAt;
  final String? volumeMetricsWeight;
  final String? volume;
  final String? dailyLimitByCart;
  final String? dailyLimitByUser;
  final String? salesTaxRate;
  final String? salesCode;
  final String? promoProfitRate;
  final String? purchaseTaxRate;
  final String? quantity;
  final String? sizeHorizontal;
  final String? sizeVertical;
  final String? sizeHeight;
  final String? maxDeliveryDuration;
  final String? brandId;
  final String? maximumStorageDays;
  final String? storeCode;
  final String? usageNotes;
  final String? brand;
  final String? model;
  final String? rmaCondition;
  final String? storagePrecautions;
  final String? usageDuration;
  final String? rmaDuration;
  final String? unit;
  final String? storageCategory;
  final String? salesUomUnitOfMeasure;
  final String? sizeType;
  final String? weightTypeMart;
  final String? material;
  final String? buyPriceIncTax;
  final String? salesPriceExcTax;
  final String? shippingFeeAmount;
  final String? activity;
  final String? styleBags;
  final String? strapBags;
  final String? featuresBags;
  final String? ecoCollection;
  final String? performanceFabric;
  final String? erinRecommends;
  final String? customAttributeNew;
  final String? sale;
  final PopupNotice? popupNotice;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      CustomAttribute(
        bundleType: json['bundle_type'],
        taxClassId: json["tax_class_id"],
        limitLabel: json["limit_label"],
        freshLabel: json["fresh_label"],
        promoLabel: json["promo_label"],
        saleOffLabel: json["sale_off_label"],
        disableDisplay: json["disable_display"],
        isWithGift: json["is_with_gift"],
        isFreeGift: json["is_free_gift"],
        freshClassification: json["fresh_classification"],
        freshMeat: json["fresh_meat"],
        trader: json["trader"],
        needIcePack: json["need_ice_pack"],
        nationwideDelivery: json["nationwide_delivery"],
        isDietarySupplement: json["is_dietary_supplement"],
        useDefaultShippingFee: json["use_default_shipping_fee"],
        isBulky: json["is_bulky"],
        gmdSource: json["gmd_source"],
        discountDisplay: json["discount_display"],
        includeSavingPoint: json["include_saving_point"],
        displayUom: json["displa_uom"],
        allowCodPayment: json["allow_cod_payment"],
        enableRma: json["enable_rma"],
        dailyLimitByUserFromDate:
            DynamicParser.parseDate(json["daily_limit_by_user_from_date"]),
        dailyLimitByUserToDate:
            DynamicParser.parseDate(json["daily_limit_by_user_to_date"]),
        publishedAt: DynamicParser.parseDate(json["published_at"]),
        volumeMetricsWeight: json["volume_metrics_weight"],
        volume: json["volume"],
        dailyLimitByCart: json["daily_limit_by_cart"],
        dailyLimitByUser: json["daily_limit_by_user"],
        salesTaxRate: json["sales_tax_rate"],
        salesCode: json["sales_code"],
        promoProfitRate: json["promo_profitRate"],
        purchaseTaxRate: json["purchase_tax_rate"],
        quantity: json["quantity"],
        sizeHorizontal: json["size_horizontal"],
        sizeVertical: json["size_vertical"],
        sizeHeight: json["size_height"],
        maxDeliveryDuration: json["max_delivery_duration"],
        brandId: json["brand_id"],
        maximumStorageDays: json["maximum_storage_days"],
        storeCode: json["store_code"],
        usageNotes: json["usage_notes"],
        brand: json["brand"],
        model: json["model"],
        rmaCondition: json["rma_condition"],
        storagePrecautions: json["storage_precautions"],
        usageDuration: json["usage_duration"],
        rmaDuration: json["rma_duration"],
        unit: json["unit"],
        storageCategory: json["storage_category"],
        salesUomUnitOfMeasure: json["sales_uom_unit_of_measure"],
        sizeType: json["size_type"],
        weightTypeMart: json["weight_type_mart"],
        material: json["material"],
        buyPriceIncTax: json["buy_price_inc_tax"],
        salesPriceExcTax: json["sales_price_exc_tax"],
        shippingFeeAmount: json["shipping_fee_amount"],
        activity: json["activity"],
        styleBags: json["style_bags"],
        strapBags: json["strap_bags"],
        featuresBags: json["features_bags"],
        ecoCollection: json["eco_collection"],
        performanceFabric: json["performance_fabric"],
        erinRecommends: json["erin_recommends"],
        customAttributeNew: json["new"],
        sale: json["sale"],
        popupNotice: json['popup_notice'] != null
            ? PopupNotice.values.firstWhereOrNull((v) =>
                (json['popup_notice'] as String)
                    .replaceAll(' ', '_')
                    .toLowerCase() ==
                v.name)
            : null,
      );
}

class BundleOption {
  BundleOption({
    this.options,
    this.optionId,
    this.type,
    this.title,
    this.isRequired,
  });

  List<BundleOptionValue>? options;
  int? optionId;
  String? type;
  String? title;
  bool? isRequired;

  factory BundleOption.fromRawJson(String str) =>
      BundleOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BundleOption.fromJson(Map<String, dynamic> json) => BundleOption(
        options: json["options"] == null
            ? null
            : (json["options"] as List)
                .map((e) => BundleOptionValue.fromJson(e))
                .toList(),
        optionId: DynamicParser.parseInt(json["option_id"]),
        type: json["type"],
        title: json["title"],
        isRequired: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "options": options,
        "option_id": optionId,
        "type": type,
        "title": title,
        "required": isRequired,
      };
}

class BundleOptionValue {
  BundleOptionValue({
    this.position,
    this.selectionId,
    this.qty,
    this.isDefault,
    this.priceType,
    this.canChangeQuantity,
    this.productId,
    this.title,
    this.thumbnail,
    this.isEnable = false,
  });

  String? position;
  int? selectionId;
  int? qty;
  bool? isDefault;
  String? priceType;
  String? canChangeQuantity;
  int? productId;
  String? title;
  String? thumbnail;
  bool isEnable;

  factory BundleOptionValue.fromJson(Map<String, dynamic> json) =>
      BundleOptionValue(
        position: json["position"],
        selectionId: DynamicParser.parseInt(json["selection_id"]),
        qty: json["qty"],
        isDefault: json["is_default"],
        priceType: json["price_type"],
        canChangeQuantity: json["can_change_quantity"],
        productId: DynamicParser.parseInt(json["product_id"]),
        title: json['title'],
        thumbnail: json['thumbnail'],
        isEnable: json['is_enabled'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "selection_id": selectionId,
        "qty": qty,
        "is_default": isDefault,
        "price_type": priceType,
        "can_change_quantity": canChangeQuantity,
        "product_id": productId,
        'title': title,
        'thumbnail': thumbnail,
        'is_enabled': isEnable,
      };
}

class ChildStock {
  ChildStock({
    this.id,
    this.stockQty = 0,
    this.inStock = false,
    this.maxSaleQty,
    this.minSaleQty,
  });

  final int? id;
  final int stockQty;
  final bool inStock;
  final int? maxSaleQty;
  final int? minSaleQty;

  factory ChildStock.fromJson(Map<String, dynamic> json) {
    //
    final stock = DynamicParser.parseInt(json['stock_qty']) ?? 0;

    return ChildStock(
      id: json["id"],
      stockQty: stock <= 0 ? 0 : stock,
      inStock: DynamicParser.parseInt(json["in_stock"]) == 1,
      maxSaleQty: json["max_sale_qty"],
      minSaleQty: json["min_sale_qty"],
    );
  }
}

class ConfigurableOption extends Equatable {
  final String? label;
  final String? attributeCode;
  final String? esAttributeCode;
  final int? position;
  final int? attributeId;
  final int? productSuperAttrId;
  final List<CfgOptionValue>? values;

  const ConfigurableOption({
    this.label,
    this.attributeCode,
    this.esAttributeCode,
    this.position,
    this.attributeId,
    this.productSuperAttrId,
    this.values,
  });

  @override
  List<Object?> get props {
    return [
      label,
      attributeCode,
      esAttributeCode,
      position,
      attributeId,
      productSuperAttrId,
      values,
    ];
  }

  factory ConfigurableOption.fromJson(Map<String, dynamic> map) {
    return ConfigurableOption(
      label: map['label'],
      attributeCode: map['attribute_code'],
      esAttributeCode: map['esAttribute_code'],
      position: DynamicParser.parseInt(map['position']),
      attributeId: DynamicParser.parseInt(map['attribute_id']),
      productSuperAttrId: map['product_super_attribute_id'],
      values: map['values'] != null
          ? (map['values'] as Map)
              .values
              .map((e) => CfgOptionValue.fromJson(e))
              .toList()
          : null,
    );
  }
}

class CfgOptionValue extends Equatable {
  const CfgOptionValue({
    this.label,
    this.name,
    this.attributeId,
    this.productSuperAttrId,
    this.valueIndex,
  });

  final String? label;
  final String? name;
  final int? valueIndex;
  final int? attributeId;
  final int? productSuperAttrId;

  factory CfgOptionValue.fromJson(Map<String, dynamic> json) {
    return CfgOptionValue(
      valueIndex: DynamicParser.parseInt(json['value_index']),
      label: json['label'],
      name: json['name'],
      attributeId: DynamicParser.parseInt(json['attribute_id']),
      productSuperAttrId:
          DynamicParser.parseInt(json['product_super_attribute_id']),
    );
  }

  @override
  List<Object?> get props => [
        valueIndex,
        label,
        name,
        attributeId,
        productSuperAttrId,
      ];
}

class ConfigurableChild extends Equatable {
  const ConfigurableChild({
    this.id,
    this.sku,
    this.options,
    this.mediaGallery,
  });

  final int? id;
  final String? sku;
  final List<CfgOptionValue>? options;
  final MediaGallery? mediaGallery;

  factory ConfigurableChild.fromJson(Map<String, dynamic> json) {
    return ConfigurableChild(
      id: DynamicParser.parseInt(json['id']),
      sku: json['sku'],
      options: json['options'] != null
          ? (json['options'] as Map)
              .values
              .map((e) => CfgOptionValue.fromJson(e))
              .toList()
          : null,
      mediaGallery: json['media_gallery'] == null
          ? null
          : MediaGallery.fromJson(json['media_gallery']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        sku,
        options,
      ];
}

class Label {
  Label({
    this.labelId,
    this.name,
    this.status,
    this.priority,
    this.isSingle,
    this.useForParent,
    this.updatedAt,
    this.categoryLabelText,
    this.categoryImage,
    this.categoryImageSize,
    this.categoryPosition,
    this.categoryStyle,
    this.productLabelText,
    this.productImage,
    this.productImageSize,
    this.productPosition,
    this.productStyle,
  });

  final String? labelId;
  final String? name;
  final String? status;
  final String? priority;
  final String? isSingle;
  final String? useForParent;
  final int? updatedAt;
  final String? categoryLabelText;
  final String? categoryImage;
  final String? categoryImageSize;
  final int? categoryPosition;
  final String? categoryStyle;
  final String? productLabelText;
  final String? productImage;
  final String? productImageSize;
  final int? productPosition;
  final String? productStyle;

  Label copyWith({
    String? labelId,
    String? name,
    String? status,
    String? priority,
    String? isSingle,
    String? useForParent,
    int? updatedAt,
    String? categoryLabelText,
    String? categoryImage,
    String? categoryImageSize,
    int? categoryPosition,
    String? categoryStyle,
    String? productLabelText,
    String? productImage,
    String? productImageSize,
    int? productPosition,
    String? productStyle,
  }) =>
      Label(
        labelId: labelId ?? this.labelId,
        name: name ?? this.name,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        isSingle: isSingle ?? this.isSingle,
        useForParent: useForParent ?? this.useForParent,
        updatedAt: updatedAt ?? this.updatedAt,
        categoryLabelText: categoryLabelText ?? this.categoryLabelText,
        categoryImage: categoryImage ?? this.categoryImage,
        categoryImageSize: categoryImageSize ?? this.categoryImageSize,
        categoryPosition: categoryPosition ?? this.categoryPosition,
        categoryStyle: categoryStyle ?? this.categoryStyle,
        productLabelText: productLabelText ?? this.productLabelText,
        productImage: productImage ?? this.productImage,
        productImageSize: productImageSize ?? this.productImageSize,
        productPosition: productPosition ?? this.productPosition,
        productStyle: productStyle ?? this.productStyle,
      );

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        labelId: json["label_id"],
        name: json["name"],
        status: json["status"],
        priority: json["priority"],
        isSingle: json["is_single"],
        useForParent: json["use_for_parent"],
        updatedAt: json["updated_at"],
        categoryLabelText: json["category_label_text"],
        categoryImage: json["category_image"],
        productImage: json["product_image"],
        categoryImageSize: json["category_image_size"],
        categoryPosition: DynamicParser.parseInt(json["category_position"]),
        categoryStyle: json["category_style"],
        productLabelText: json["product_label_text"],
        productImageSize: json["product_image_size"],
        productPosition: DynamicParser.parseInt(json["product_position"]),
        productStyle: json["product_style"],
      );

  Map<String, dynamic> toJson() => {
        "label_id": labelId,
        "name": name,
        "status": status,
        "priority": priority,
        "is_single": isSingle,
        "use_for_parent": useForParent,
        "updated_at": updatedAt,
        "category_label_text": categoryLabelText,
        "category_image": categoryImage,
        "category_image_size": categoryImageSize,
        "category_position": categoryPosition,
        "category_style": categoryStyle,
        "product_label_text": productLabelText,
        "product_image": productImage,
        "product_image_size": productImageSize,
        "product_position": productPosition,
        "product_style": productStyle,
      };
}
