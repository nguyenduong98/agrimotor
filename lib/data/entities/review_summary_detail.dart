part of 'entities.dart';

class RatingSummaryDetail extends Equatable {
  const RatingSummaryDetail({
    this.ratingAvg,
    this.title,
    this.priority,
    this.ratingId,
  });

  final double? ratingAvg;
  final String? title;
  final int? priority;
  final String? ratingId;

  RatingSummaryDetail copyWith({
    double? ratingAvg,
    String? title,
    int? priority,
    String? ratingId,
  }) =>
      RatingSummaryDetail(
        ratingAvg: ratingAvg ?? this.ratingAvg,
        title: title ?? this.title,
        priority: priority ?? this.priority,
        ratingId: ratingId ?? this.ratingId,
      );

  factory RatingSummaryDetail.fromJson(Map<String, dynamic> json) =>
      RatingSummaryDetail(
        ratingAvg: DynamicParser.parseDouble(json["rating_avg"]),
        title: json["title"],
        priority: json["priority"],
        ratingId: json["rating_id"],
      );

  @override
  List<Object?> get props => [
        ratingAvg,
        title,
        priority,
        ratingId,
      ];
}
