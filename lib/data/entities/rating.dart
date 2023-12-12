part of 'entities.dart';

class Rating extends Equatable {
  const Rating({
    this.ratingTitle,
    this.ratingValue,
  });

  final String? ratingTitle;
  final int? ratingValue;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        ratingTitle: json["rating_title"],
        ratingValue: DynamicParser.parseInt(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "rating_title": ratingTitle,
        "value": ratingValue,
      };

  @override
  List<Object?> get props => [
        ratingTitle,
        ratingValue,
      ];
}
