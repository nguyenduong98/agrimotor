part of 'entities.dart';

class ReviewComment extends Equatable {
  const ReviewComment({
    this.reviewImages,
    this.stores,
    this.ratings,
    this.reviewId,
    this.createdAt,
    this.entityId,
    this.entityPkValue,
    this.statusId,
    this.detailId,
    this.storeId,
    this.title,
    this.detail,
    this.nickname,
    this.avatar,
    this.answer,
  });

  final List<ReviewImage>? reviewImages;
  final List<String>? stores;
  final List<Rating>? ratings;
  final int? reviewId;
  final DateTime? createdAt;
  final int? entityId;
  final int? entityPkValue;
  final int? statusId;
  final int? detailId;
  final int? storeId;
  final String? title;
  final String? detail;
  final String? nickname;
  final String? avatar;
  final String? answer;

  double get avgRating {
    if (ratings.isNotNullAndNotEmpty()) {
      return ratings!
              .map((m) => m.ratingValue)
              .reduce((a, b) => (a ?? 0) + (b ?? 0))! /
          ratings!.length;
    } else {
      return 0;
    }
  }

  ReviewComment copyWith({
    List<ReviewImage>? reviewImages,
    List<String>? stores,
    List<Rating>? ratings,
    int? reviewId,
    DateTime? createdAt,
    int? entityId,
    int? entityPkValue,
    int? statusId,
    int? detailId,
    int? storeId,
    String? title,
    String? detail,
    String? nickname,
    String? avatar,
    String? answer,
  }) =>
      ReviewComment(
        reviewImages: reviewImages ?? this.reviewImages,
        stores: stores ?? this.stores,
        ratings: ratings ?? this.ratings,
        reviewId: reviewId ?? this.reviewId,
        createdAt: createdAt ?? this.createdAt,
        entityId: entityId ?? this.entityId,
        entityPkValue: entityPkValue ?? this.entityPkValue,
        statusId: statusId ?? this.statusId,
        detailId: detailId ?? this.detailId,
        storeId: storeId ?? this.storeId,
        title: title ?? this.title,
        detail: detail ?? this.detail,
        nickname: nickname ?? this.nickname,
        avatar: avatar ?? this.avatar,
        answer: answer ?? this.answer,
      );

  factory ReviewComment.fromJson(Map<String, dynamic> json) => ReviewComment(
        reviewImages: json["review_images"] == null
            ? null
            : (json["review_images"] as List)
                .map((e) => ReviewImage.fromJson(e))
                .toList(),
        stores: json["stores"] == null ? [] : json['stores']?.cast<String>(),
        ratings: json["ratings"] == null
            ? []
            : (json['ratings'] as List).map((e) => Rating.fromJson(e)).toList(),
        reviewId: DynamicParser.parseInt(json["review_id"]),
        createdAt: json["created_at"] == null
            ? null
            : DynamicParser.parseDateFromTimeStamp(json["created_at"]),
        entityId: DynamicParser.parseInt(json["entity_id"]),
        entityPkValue: DynamicParser.parseInt(json["entity_pk_value"]),
        statusId: DynamicParser.parseInt(json["status_id"]),
        detailId: DynamicParser.parseInt(json["detail_id"]),
        storeId: DynamicParser.parseInt(json["store_id"]),
        title: json["title"],
        detail: json["detail"],
        nickname: json["nickname"],
        avatar: json["customer_avatar"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "review_images": reviewImages == null
            ? []
            : List<dynamic>.from(reviewImages!.map((x) => x)),
        "stores":
            stores == null ? [] : List<dynamic>.from(stores!.map((x) => x)),
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "review_id": reviewId,
        "created_at": createdAt,
        "entity_id": entityId,
        "entity_pk_value": entityPkValue,
        "status_id": statusId,
        "detail_id": detailId,
        "store_id": storeId,
        "title": title,
        "detail": detail,
        "nickname": nickname,
        "customer_avatar": avatar,
      };

  @override
  List<Object?> get props => [
        reviewImages,
        stores,
        ratings,
        reviewId,
        createdAt,
        entityId,
        entityPkValue,
        statusId,
        detailId,
        storeId,
        title,
        detail,
        nickname,
        avatar,
        answer,
      ];
}
