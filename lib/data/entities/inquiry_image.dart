part of 'entities.dart';

class InquiryImage extends Equatable {
  const InquiryImage({
    this.id,
    this.inquiryId,
    this.path,
    this.uploaderType,
  });

  final String? id;
  final String? inquiryId;
  final String? path;
  final String? uploaderType;

  InquiryImage copyWith({
    String? id,
    String? inquiryId,
    String? path,
    String? uploaderType,
  }) =>
      InquiryImage(
        id: id ?? this.id,
        inquiryId: inquiryId ?? this.inquiryId,
        path: path ?? this.path,
        uploaderType: uploaderType ?? this.uploaderType,
      );

  factory InquiryImage.fromJson(Map<String, dynamic> json) => InquiryImage(
        id: json["inquiryimage_id"],
        inquiryId: json["inquiry_id"],
        path: json["path"],
        uploaderType: json["uploader_type"],
      );

  Map<String, dynamic> toJson() => {
        "inquiryimage_id": id,
        "inquiry_id": inquiryId,
        "path": path,
        "uploader_type": uploaderType,
      };

  @override
  List<Object?> get props => [
        id,
        inquiryId,
        path,
        uploaderType,
      ];
}
