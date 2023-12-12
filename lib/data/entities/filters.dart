part of 'entities.dart';

class FacetFilterType {
  static const String checkbox = 'checkbox';
  static const String radio = 'radio';
  static const String range = 'range';
}

class FacetFilter<T> extends Equatable {
  //* List string or int
  final List<T>? options;
  final String? type;
  final String? name;
  final String? field;

  const FacetFilter({
    this.type,
    this.name,
    this.field,
    this.options,
  });

  factory FacetFilter.fromJson(Map<String, dynamic> json) {
    return FacetFilter(
      type: json['type'],
      name: json['name'],
      field: json['field'],
      options: json['options'] == null
          ? null
          : (json['options'] as List).map<T>((e) => e).toList(),
    );
  }

  FacetFilter copyWith({
    String? type,
    String? name,
    String? field,
    List<T>? options,
  }) =>
      FacetFilter(
        field: field ?? this.field,
        name: name ?? this.name,
        type: type ?? this.type,
        options: options ?? this.options,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'field': field,
        'options': options,
      };

  @override
  List<Object?> get props => [
        type,
        name,
        field,
        options,
      ];

  List<String> get optionsLabels =>
      options?.map((e) => e.toString()).toList() ?? [];
}

class FacetFilterCategory extends FacetFilter<Category> {
  const FacetFilterCategory({
    super.type,
    super.name,
    super.field,
    super.options,
  });

  factory FacetFilterCategory.fromJson(Map<String, dynamic> json) =>
      FacetFilterCategory(
        field: json['field'],
        name: json['name'],
        type: json['type'],
        options: json['options'] != null
            ? (json['options'] as List)
                .map((e) => Category.fromJson(e))
                .toList()
            : null,
      );

  @override
  FacetFilterCategory copyWith({
    String? field,
    String? name,
    String? type,
    List<Category>? options,
  }) =>
      FacetFilterCategory(
        field: field ?? this.field,
        name: name ?? this.name,
        options: options ?? this.options,
        type: type ?? this.type,
      );
}

class FacetFilterPrice extends FacetFilter<PriceOption> {
  final double? min;
  final double? max;

  const FacetFilterPrice({
    this.min,
    this.max,
    super.options,
    super.field,
    super.name,
    super.type,
  });

  factory FacetFilterPrice.fromJson(Map<String, dynamic> json) =>
      FacetFilterPrice(
        field: json['field'],
        name: json['name'],
        type: json['type'],
        min:
            json['min'] != null ? DynamicParser.parseDouble(json['min']) : null,
        max:
            json['max'] != null ? DynamicParser.parseDouble(json['max']) : null,
        options: json['options'] == null
            ? null
            : ((json['options'] as List)
                .map((e) => PriceOption.fromJson(e))
                .toList())
          ?..retainWhere((e) =>
              ((e.from ?? 0) > 0 && (e.to ?? 0) > 0) ||
              ((e.from ?? 0) > 0 || (e.to ?? 0) > 0)),
      );

  @override
  FacetFilterPrice copyWith({
    String? type,
    String? name,
    String? field,
    List<PriceOption>? options,
  }) =>
      FacetFilterPrice(
        type: type ?? this.type,
        name: name ?? this.name,
        field: field ?? this.field,
        options: options ?? this.options,
      );

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'field': field,
        'min': min,
        'max': max,
        "options": options == null
            ? []
            : List<PriceOption>.from(options!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        type,
        name,
        field,
        options,
        min,
        max,
      ];
}

class PriceOption extends Equatable {
  final double? from;
  final double? to;

  const PriceOption({
    this.from,
    this.to,
  });

  factory PriceOption.fromJson(Map<String, dynamic> json) => PriceOption(
        from: json['from'] != null
            ? DynamicParser.parseDouble(json['from'])
            : null,
        to: json['to'] != null ? DynamicParser.parseDouble(json['to']) : null,
      );

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
      };

  @override
  List<Object?> get props => [from, to];
}

class FacetFilterCustomAttribute extends Equatable {
  const FacetFilterCustomAttribute({
    this.allowCodPayment,
    this.material,
    this.enableGiftWraping,
    this.unit,
    this.brandOrigin,
    this.limitLabel,
    this.importLabel,
    this.promoLabel,
    this.saleOffLabel,
    this.nationwideDelivery,
  });

  final FacetFilter? allowCodPayment;
  final FacetFilter? material;
  final FacetFilter? enableGiftWraping;
  final FacetFilter? unit;
  final FacetFilter? brandOrigin;
  final FacetFilter? limitLabel;
  final FacetFilter? importLabel;
  final FacetFilter? promoLabel;
  final FacetFilter? saleOffLabel;
  final FacetFilter? nationwideDelivery;

  factory FacetFilterCustomAttribute.fromJson(Map<String, dynamic> json) =>
      FacetFilterCustomAttribute(
        allowCodPayment: json["allow_cod_payment"] == null
            ? null
            : FacetFilter.fromJson(json["allow_cod_payment"]),
        material: json["material"] == null
            ? null
            : FacetFilter.fromJson(json["material"]),
        enableGiftWraping: json["enable_gift_wraping"] == null
            ? null
            : FacetFilter.fromJson(json["enable_gift_wraping"]),
        unit: json["unit"] == null ? null : FacetFilter.fromJson(json["unit"]),
        brandOrigin: json["brand_origin"] == null
            ? null
            : FacetFilter.fromJson(json["brand_origin"]),
        limitLabel: json["limit_label"] == null
            ? null
            : FacetFilter.fromJson(json["limit_label"]),
        importLabel: json["import_label"] == null
            ? null
            : FacetFilter.fromJson(json["import_label"]),
        promoLabel: json["promo_label"] == null
            ? null
            : FacetFilter.fromJson(json["promo_label"]),
        saleOffLabel: json["sale_off_label"] == null
            ? null
            : FacetFilter.fromJson(json["sale_off_label"]),
        nationwideDelivery: json["nationwide_delivery"] == null
            ? null
            : FacetFilter.fromJson(json["nationwide_delivery"]),
      );

  Map<String, dynamic> toJson() => {
        "allow_cod_payment": allowCodPayment?.toJson(),
        "material": material?.toJson(),
        "enable_gift_wraping": enableGiftWraping?.toJson(),
        "unit": unit?.toJson(),
        "brand_origin": brandOrigin?.toJson(),
        "limit_label": limitLabel?.toJson(),
        "import_label": importLabel?.toJson(),
        "promo_label": promoLabel?.toJson(),
        "sale_off_label": saleOffLabel?.toJson(),
        "nationwide_delivery": nationwideDelivery?.toJson(),
      };

  @override
  List<FacetFilter?> get props => [
        allowCodPayment,
        material,
        enableGiftWraping,
        unit,
        brandOrigin,
        limitLabel,
        importLabel,
        promoLabel,
        saleOffLabel,
        nationwideDelivery,
      ];
}

class FacetFilterPromotion extends FacetFilter<PromotionOption> {
  const FacetFilterPromotion({
    super.type,
    super.name,
    super.field,
    super.options,
  });

  factory FacetFilterPromotion.fromJson(Map<String, dynamic> json) =>
      FacetFilterPromotion(
        field: json['field'],
        name: json['name'],
        type: json['type'],
        options: json['options'] != null
            ? (json['options'] as List)
                .map((e) => PromotionOption.fromJson(e))
                .toList()
            : null,
      );
}

class PromotionOption extends Equatable {
  const PromotionOption({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  factory PromotionOption.fromJson(Map<String, dynamic> json) =>
      PromotionOption(
        label: json['label'],
        value: json['value'],
      );

  @override
  List<Object?> get props => [
        label,
        value,
      ];
}

class FacetFilterRating extends FacetFilter<RatingOption> {
  const FacetFilterRating({
    super.type,
    super.name,
    super.field,
    super.options,
  });

  factory FacetFilterRating.fromJson(Map<String, dynamic> json) =>
      FacetFilterRating(
        field: json['field'],
        name: json['name'],
        type: json['type'],
        options: json['options'] != null
            ? (json['options'] as List)
                .map((e) => RatingOption.fromJson(e))
                .toList()
            : null,
      );

  @override
  FacetFilterRating copyWith({
    String? type,
    String? name,
    String? field,
    List<RatingOption>? options,
  }) =>
      FacetFilterRating(
        field: field ?? this.field,
        name: name ?? this.name,
        type: type ?? this.type,
        options: options ?? this.options,
      );
}

class RatingOption extends Equatable {
  final int? from;
  final int? to;

  const RatingOption({
    this.from,
    this.to,
  });

  factory RatingOption.fromJson(Map<String, dynamic> json) {
    return RatingOption(
      from: DynamicParser.parseInt(json['from']),
      to: DynamicParser.parseInt(json['to']),
    );
  }

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
      };

  @override
  List<Object?> get props => [from, to];
}
