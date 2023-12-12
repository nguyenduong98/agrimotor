part of 'entities.dart';

class FAQCategory extends Equatable {
  const FAQCategory({
    this.categoryId,
    this.title,
    this.image,
    this.identifier,
    this.faqs,
  });

  final int? categoryId;
  final String? title;
  final String? image;
  final String? identifier;
  final List<Faq>? faqs;

  FAQCategory copyWith({
    int? categoryId,
    String? title,
    String? image,
    String? identifier,
    List<Faq>? faqs,
  }) =>
      FAQCategory(
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        image: image ?? this.image,
        identifier: identifier ?? this.identifier,
        faqs: faqs ?? this.faqs,
      );

  factory FAQCategory.fromJson(Map<String, dynamic> json) => FAQCategory(
        categoryId: json["category_id"],
        title: json["title"],
        image: json["image"],
        identifier: json["identifier"],
        faqs: json["faqs"] == null
            ? []
            : (json["faqs"] as List).map((e) => Faq.fromJson(e)).toList(),
      );

  @override
  List<Object?> get props => [
        categoryId,
        title,
        image,
        identifier,
        faqs,
      ];
}
