part of 'entities.dart';

class RmaReasonEntity extends Equatable {
  
  const RmaReasonEntity({
    this.reasonCode,
    this.reasonLabel,
    this.reasonId,
  });

  final String? reasonCode;
  final String? reasonLabel;
  final int? reasonId;

  factory RmaReasonEntity.fromJson(Map<String, dynamic> json) =>
      RmaReasonEntity(
        reasonId: DynamicParser.parseInt(json['reason_id']),
        reasonCode: json['reason_code'],
        reasonLabel: json['reason_label'],
      );

  @override
  List<Object?> get props => [reasonCode, reasonLabel, reasonId];
}