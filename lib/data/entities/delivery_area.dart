part of 'entities.dart';

class DeliveryArea extends Equatable {
  const DeliveryArea({
    this.districtId,
    this.districtName,
    this.wards,
    this.supportAllWards,
  });

  final String? districtId;
  final String? districtName;
  final List<Ward>? wards;
  final bool? supportAllWards;

  DeliveryArea copyWith({
    String? districtId,
    String? districtName,
    List<Ward>? wards,
    bool? supportAllWards,
  }) =>
      DeliveryArea(
        districtId: districtId ?? this.districtId,
        districtName: districtName ?? this.districtName,
        wards: wards ?? this.wards,
        supportAllWards: supportAllWards ?? this.supportAllWards,
      );

  factory DeliveryArea.fromJson(Map<String, dynamic> json) => DeliveryArea(
    districtId: json["district_id"],
    districtName: json["district_name"],
    wards: json["wards"] == null ? [] : (json['wards'] as List).map((e) => Ward.fromJson(e)).toList(),
    supportAllWards: json["support_all_wards"],
  );

  @override
  List<Object?> get props => [
    districtId,
    districtName,
    wards,
    supportAllWards
  ];
}