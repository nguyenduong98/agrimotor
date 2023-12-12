part of 'entities.dart';

class InquiryType extends Equatable {
  const InquiryType({
    this.inquiryTypeId,
    this.name,
    this.identifier,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.children,
    this.parentId,
  });

  final int? inquiryTypeId;
  final String? name;
  final String? identifier;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? isActive;
  final List<InquiryType>? children;
  final int? parentId;

  InquiryType copyWith({
    int? inquiryTypeId,
    String? name,
    String? identifier,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? isActive,
    List<InquiryType>? children,
    int? parentId,
  }) =>
      InquiryType(
        inquiryTypeId: inquiryTypeId ?? this.inquiryTypeId,
        name: name ?? this.name,
        identifier: identifier ?? this.identifier,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
        children: children ?? this.children,
        parentId: parentId ?? this.parentId,
      );

  factory InquiryType.fromJson(Map<String, dynamic> json) => InquiryType(
        inquiryTypeId: DynamicParser.parseInt(json["inquirytype_id"]),
        name: json["name"],
        identifier: json["identifier"],
        createdAt: DynamicParser.tryParseUtc(json["created_at"]),
        updatedAt: DynamicParser.tryParseUtc(json["updated_at"]),
        isActive: json["is_active"],
        children: json["children"] == null
            ? []
            : (json['children'] as List)
                .map((e) => InquiryType.fromJson(e))
                .toList(),
        parentId: DynamicParser.parseInt(json["parent_id"]),
      );

  @override
  List<Object?> get props => [
        inquiryTypeId,
        name,
        identifier,
        createdAt,
        updatedAt,
        isActive,
        children,
        parentId,
      ];
}
