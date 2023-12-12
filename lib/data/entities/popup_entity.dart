part of 'entities.dart';

class PopupPositionConst {
  const PopupPositionConst._();

  static const homePage = 'homepage';
  static const wine = 'wine';
  static const milk = 'milk';
  static const supplement = 'supplement';
}

class PopupEntity extends Equatable {
  final int? id;
  final String imageUrl;
  final String? url;
  final bool? isActive;
  final int? type;
  final String? content;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? position;
  final Product? product;
  final List<AdditionalImageEntity> additionalImage;

  const PopupEntity({
    this.type,
    this.content,
    this.url,
    this.isActive,
    this.fromDate,
    this.toDate,
    this.position,
    this.imageUrl = '',
    this.id,
    this.product,
    this.additionalImage = const [],
  });

  factory PopupEntity.fromJson(Map<String, dynamic> json) => PopupEntity(
        content: json['content'],
        isActive: json['is_active'],
        fromDate: DynamicParser.parseDate(json['from_date']),
        toDate: DynamicParser.parseDate(json['to_date']),
        id: DynamicParser.parseInt(json['id']),
        imageUrl: json['image_url'] ?? '',
        position: json['position'],
        type: DynamicParser.parseInt(json['type']),
        product:
            json['product'] == null ? null : Product.fromJson(json['product']),
        additionalImage: json['additional_image'] == null
            ? []
            : (json['additional_image'] as List)
                .map((e) => AdditionalImageEntity.fromJson(e))
                .toList(),
        url: json['url']
      );

  @override
  List<Object?> get props => [
        type,
        content,
        fromDate,
        toDate,
        position,
        imageUrl,
        id,
        product,
        additionalImage,
        isActive,
        url,
      ];
}

class AdditionalImageEntity extends Equatable {
  final String url;
  final String imageUrl;

  const AdditionalImageEntity({
    this.url = '',
    this.imageUrl = '',
  });

  factory AdditionalImageEntity.fromJson(Map<String, dynamic> json) =>
      AdditionalImageEntity(
        url: json['url'] ?? '',
        imageUrl: json['image_url'] ?? '',
      );

  @override
  List<Object?> get props => [
        url,
        imageUrl,
      ];
}
