part of 'entities.dart';

class ReviewImage extends Equatable {
  const ReviewImage({
    this.imageId,
    this.reviewId,
    this.path,
  });

  final String? imageId;
  final String? reviewId;
  final String? path;

  ReviewImage copyWith({
    String? imageId,
    String? reviewId,
    String? path,
  }) =>
      ReviewImage(
        imageId: imageId ?? this.imageId,
        reviewId: reviewId ?? this.reviewId,
        path: path ?? this.path,
      );

  factory ReviewImage.fromJson(Map<String, dynamic> json) => ReviewImage(
    imageId: json["image_id"],
    reviewId: json["review_id"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId,
    "review_id": reviewId,
    "path": path,
  };

  @override
  List<Object?> get props => [
    imageId,
    reviewId,
    path,
  ];
}
