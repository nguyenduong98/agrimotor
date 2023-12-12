part of 'entities.dart';

class DeliveryStatus {
  static const String available = 'available';
  static const String fully = 'fully';
  static const String closed = 'closed';
}

class DeliveryHour extends Equatable {
  const DeliveryHour({
    this.timeSlot,
    this.timeSlotLabel,
    this.status,
    this.deliveryDate,
  });

  final String? timeSlot;
  final String? timeSlotLabel;
  final String? status;
  final DateTime? deliveryDate;

  int get id => hashCode;

  DeliveryHour copyWith({
    String? timeSlot,
    String? timeSlotLabel,
    String? status,
    DateTime? deliveryDate,
  }) =>
      DeliveryHour(
        timeSlot: timeSlot ?? this.timeSlot,
        timeSlotLabel: timeSlotLabel ?? this.timeSlotLabel,
        status: status ?? this.status,
        deliveryDate: deliveryDate ?? this.deliveryDate,
      );

  factory DeliveryHour.fromJson(Map<String, dynamic> json) => DeliveryHour(
        timeSlot: json["time_slot_extend"],
        timeSlotLabel: json["time_slot_label"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "time_slot": timeSlot,
        "status": status,
      };

  @override
  List<Object?> get props => [
        timeSlot,
        timeSlotLabel,
        deliveryDate,
      ];
}

class DeliveryTime extends Equatable {
  const DeliveryTime({
    this.deliveryDate,
    this.deliveryHour,
  });

  final DateTime? deliveryDate;
  final List<DeliveryHour>? deliveryHour;

  DeliveryTime copyWith({
    DateTime? deliveryDate,
    List<DeliveryHour>? deliveryHour,
  }) =>
      DeliveryTime(
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryHour: deliveryHour ?? this.deliveryHour,
      );

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        deliveryDate: DateTimeUtil.tryParse(json["delivery_date"]),
        deliveryHour: json["delivery_hour"] == null
            ? []
            : List<DeliveryHour>.from(
                json["delivery_hour"]!.map((x) => DeliveryHour.fromJson(x)),
              ),
      );

  @override
  List<Object?> get props => [
        deliveryDate,
        deliveryHour,
      ];
}
