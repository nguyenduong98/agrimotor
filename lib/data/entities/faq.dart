part of 'entities.dart';

class Faq extends Equatable {
  const Faq({
    this.faqId,
    this.title,
    this.identifier,
    this.creationTime,
    this.updateTime,
    this.isActive,
    this.sortOrder,
    this.liked,
    this.disliked,
    this.viewed,
    this.mostFrequently,
    this.userId,
    this.metaKeywords,
    this.metaDescription,
    this.topTen,
    this.storeId,
  });

  final String? faqId;
  final String? title;
  final String? identifier;
  final DateTime? creationTime;
  final DateTime? updateTime;
  final String? isActive;
  final String? sortOrder;
  final String? liked;
  final String? disliked;
  final String? viewed;
  final String? mostFrequently;
  final String? userId;
  final String? metaKeywords;
  final String? metaDescription;
  final String? topTen;
  final String? storeId;

  Faq copyWith({
    String? faqId,
    String? title,
    String? identifier,
    DateTime? creationTime,
    DateTime? updateTime,
    String? isActive,
    String? sortOrder,
    String? liked,
    String? disliked,
    String? viewed,
    String? mostFrequently,
    String? userId,
    String? metaKeywords,
    String? metaDescription,
    String? topTen,
    String? storeId,
  }) =>
      Faq(
        faqId: faqId ?? this.faqId,
        title: title ?? this.title,
        identifier: identifier ?? this.identifier,
        creationTime: creationTime ?? this.creationTime,
        updateTime: updateTime ?? this.updateTime,
        isActive: isActive ?? this.isActive,
        sortOrder: sortOrder ?? this.sortOrder,
        liked: liked ?? this.liked,
        disliked: disliked ?? this.disliked,
        viewed: viewed ?? this.viewed,
        mostFrequently: mostFrequently ?? this.mostFrequently,
        userId: userId ?? this.userId,
        metaKeywords: metaKeywords ?? this.metaKeywords,
        metaDescription: metaDescription ?? this.metaDescription,
        topTen: topTen ?? this.topTen,
        storeId: storeId ?? this.storeId,
      );

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        faqId: json["faq_id"],
        title: json["title"],
        identifier: json["identifier"],
        creationTime: json["creation_time"] == null
            ? null
            : DateTime.parse(json["creation_time"]),
        updateTime: json["update_time"] == null
            ? null
            : DateTime.parse(json["update_time"]),
        isActive: json["is_active"],
        sortOrder: json["sort_order"],
        liked: json["liked"],
        disliked: json["disliked"],
        viewed: json["viewed"],
        mostFrequently: json["most_frequently"],
        userId: json["user_id"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        topTen: json["top_ten"],
        storeId: json["store_id"],
      );

  @override
  List<Object?> get props => [
        faqId,
        title,
        identifier,
        creationTime,
        updateTime,
        isActive,
        sortOrder,
        liked,
        disliked,
        viewed,
        mostFrequently,
        userId,
        metaKeywords,
        metaDescription,
        topTen,
        storeId,
      ];
}
