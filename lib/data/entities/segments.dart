part of 'entities.dart';

class TotalSegment extends Equatable {
  final String? code;
  final String? title;
  final double? value;
  final SegmentExtensionAttr? extensionAttrs;

  const TotalSegment({
    this.code,
    this.title,
    this.value,
    this.extensionAttrs,
  });

  factory TotalSegment.fromJson(Map<String, dynamic> map) {
    return TotalSegment(
      code: map['code'],
      title: map['title'],
      value: DynamicParser.parseDouble(map['value']),
      extensionAttrs: map['extension_attributes'] != null
          ? SegmentExtensionAttr.fromJson(map['extension_attributes'])
          : null,
    );
  }

  @override
  List<Object?> get props {
    return [
      code,
      title,
      value,
      extensionAttrs,
    ];
  }
}

class SegmentExtensionAttr extends Equatable {
  final List<String>? taxGrandTotalDetails;

  const SegmentExtensionAttr({this.taxGrandTotalDetails});

  factory SegmentExtensionAttr.fromJson(Map<String, dynamic> map) {
    return SegmentExtensionAttr(
      taxGrandTotalDetails: map["tax_grandtotal_details"] == null
          ? []
          : map["tax_grandtotal_details"]?.cast<String>(),
    );
  }

  @override
  List<Object?> get props {
    return [
      taxGrandTotalDetails,
    ];
  }
}
