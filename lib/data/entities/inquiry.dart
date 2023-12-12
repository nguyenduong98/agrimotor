part of 'entities.dart';

class Inquiry extends Equatable {
  const Inquiry({
    this.inquiryId,
    this.status,
    this.customerId,
    this.orderId,
    this.incrementId,
    this.totalItemCount,
    this.subTotal,
    this.orderStatus,
    this.orderStatusLabel,
    this.statusDate,
    this.typeId,
    this.content,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.feedback,
    this.adminId,
    this.adminName,
    this.adminEmail,
    this.customerName,
    this.customerEmail,
    this.createdAt,
    this.updatedAt,
    this.feedbackAt,
    this.customerImages,
    this.adminImages,
  });

  final int? inquiryId;
  final String? status;
  final int? customerId;
  final int? orderId;
  final int? incrementId;
  final int? totalItemCount;
  final double? subTotal;
  final String? orderStatus;
  final String? orderStatusLabel;
  final DateTime? statusDate;
  final int? typeId;
  final String? content;
  final String? contactName;
  final String? contactPhone;
  final String? contactEmail;
  final String? feedback;
  final int? adminId;
  final String? adminName;
  final String? adminEmail;
  final String? customerName;
  final String? customerEmail;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? feedbackAt;
  final List<InquiryImage>? customerImages;
  final List<InquiryImage>? adminImages;

  Inquiry copyWith({
    int? inquiryId,
    String? status,
    int? customerId,
    int? orderId,
    int? incrementId,
    int? totalItemCount,
    double? subTotal,
    String? orderStatus,
    String? orderStatusLabel,
    DateTime? statusDate,
    int? typeId,
    String? content,
    String? contactName,
    String? contactPhone,
    String? contactEmail,
    String? feedback,
    int? adminId,
    String? adminName,
    String? adminEmail,
    String? customerName,
    String? customerEmail,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? feedbackAt,
    List<InquiryImage>? customerImages,
    List<InquiryImage>? adminImages,
  }) =>
      Inquiry(
        inquiryId: inquiryId ?? this.inquiryId,
        status: status ?? this.status,
        customerId: customerId ?? this.customerId,
        orderId: orderId ?? this.orderId,
        incrementId: incrementId ?? this.incrementId,
        totalItemCount: totalItemCount ?? this.totalItemCount,
        subTotal: subTotal ?? this.subTotal,
        orderStatus: orderStatus ?? this.orderStatus,
        orderStatusLabel: orderStatusLabel ?? this.orderStatusLabel,
        statusDate: statusDate ?? this.statusDate,
        typeId: typeId ?? this.typeId,
        content: content ?? this.content,
        contactName: contactName ?? this.contactName,
        contactPhone: contactPhone ?? this.contactPhone,
        contactEmail: contactEmail ?? this.contactEmail,
        feedback: feedback ?? this.feedback,
        adminId: adminId ?? this.adminId,
        adminName: adminName ?? this.adminName,
        adminEmail: adminEmail ?? this.adminEmail,
        customerName: customerName ?? this.customerName,
        customerEmail: customerEmail ?? this.customerEmail,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        feedbackAt: feedbackAt ?? this.feedbackAt,
        customerImages: customerImages ?? this.customerImages,
        adminImages: adminImages ?? this.adminImages,
      );

  factory Inquiry.fromJson(Map<String, dynamic> json) => Inquiry(
        inquiryId: DynamicParser.parseInt(json["inquiry_id"]),
        status: json["status"],
        customerId: DynamicParser.parseInt(json["customer_id"]),
        orderId: DynamicParser.parseInt(json["order_id"]),
        incrementId: DynamicParser.parseInt(json["increment_id"]),
        typeId: DynamicParser.parseInt(json["type_id"]),
        totalItemCount: DynamicParser.parseInt(json["total_item_count"]),
        subTotal: DynamicParser.parseDouble(json["subtotal"]),
        orderStatus: json["order_status"],
        orderStatusLabel: json["order_status_label"],
        statusDate: DynamicParser.tryParseUtc(json["status_date"]),
        content: json["content"],
        contactName: json["contact_name"],
        contactPhone: json["contact_phone"],
        contactEmail: json["contact_email"],
        feedback: json["feedback"],
        adminId: DynamicParser.parseInt(json["admin_id"]),
        adminName: json["admin_name"],
        adminEmail: json["admin_email"],
        customerName: json["customer_name"],
        customerEmail: json["customer_email"],
        createdAt: DynamicParser.tryParseUtc(json["created_at"]),
        updatedAt: DynamicParser.tryParseUtc(json["updated_at"]),
        feedbackAt: json["feedback_at"] == null
            ? null
            : DateTime.parse(json["feedback_at"]),
        customerImages: json["customer_images"] == null
            ? []
            : (json['customer_images'] as List)
                .map((e) => InquiryImage.fromJson(e))
                .toList(),
        adminImages: json["admin_images"] == null
            ? []
            : (json['admin_images'] as List)
                .map((e) => InquiryImage.fromJson(e))
                .toList(),
      );

  @override
  List<Object?> get props => [
        inquiryId,
        status,
        customerId,
        orderId,
        incrementId,
        totalItemCount,
        subTotal,
        orderStatus,
        orderStatusLabel,
        statusDate,
        typeId,
        content,
        contactName,
        contactPhone,
        contactEmail,
        feedback,
        adminId,
        adminName,
        adminEmail,
        customerName,
        customerEmail,
        createdAt,
        updatedAt,
        feedbackAt,
        customerImages,
        adminImages,
      ];
}
