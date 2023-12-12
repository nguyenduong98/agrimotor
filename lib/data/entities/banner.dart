part of 'entities.dart';

class BannerEntity extends Equatable {
  const BannerEntity({
    this.title,
    this.description,
    this.appImage,
    this.linkUrl,
    this.position,
    this.type,
    this.typeBanner,
    this.typeZone,
    this.product,
  });

  final String? title;
  final String? description;
  final String? appImage;
  final String? linkUrl;
  final int? position;
  final String? type;
  final String? typeBanner;
  final Product? product;
  final String? typeZone;

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        title: json['title'],
        description: json['description'],
        appImage: json["app_image"],
        linkUrl: json['image']?["link_url"],
        typeBanner: json['image']?['type_banner'],
        position: json["position"],
        type: json["type"],
        typeZone: json["type_zone"],
        product:
            json["product"] != null ? Product.fromJson(json["product"]) : null,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        appImage,
        linkUrl,
        position,
        type,
        typeZone,
        product,
      ];
}
