part of 'entities.dart';

class NotificationType {
  NotificationType._();

  static const general = 1;
  static const order = 2;
  static const promotion = 3;
  static const update = 4;
}

class MartNotification extends Equatable {
  final int? id;
  final String? content;
  final String? title;
  final String? targetType;
  final int? entityId;
  final int? broadcastId;
  final bool isRead;
  final DateTime? createdAt;
  final int? type;
  final String? actionUrl;
  final String? image;

  const MartNotification({
    this.id,
    this.content,
    this.title,
    this.targetType,
    this.entityId,
    this.broadcastId,
    this.isRead = false,
    this.createdAt,
    this.type,
    this.actionUrl,
    this.image,
  });

  MartNotification copyWith({
    int? id,
    String? content,
    String? title,
    String? targetType,
    int? entityId,
    int? broadcastId,
    bool? isRead,
    DateTime? createdAt,
    int? type,
    String? actionUrl,
    String? image,
  }) {
    return MartNotification(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      targetType: targetType ?? this.targetType,
      entityId: entityId ?? this.entityId,
      broadcastId: broadcastId ?? this.broadcastId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      actionUrl: actionUrl ?? this.actionUrl,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'notification_id': id,
      'content': content,
      'title': title,
      'target_type': targetType,
      'entity_id': entityId,
      'broadcast_id': broadcastId,
      'is_read': isRead,
      'created_at': createdAt != null
          ? DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt!)
          : null,
      'type': type,
      'action_url': actionUrl,
      'images': image,
    };
  }

  factory MartNotification.fromJson(Map<String, dynamic> map) {
    return MartNotification(
      id: DynamicParser.parseInt(map['notification_id']),
      content: map['content'],
      title: map['title'],
      targetType: map['target_type'],
      entityId: DynamicParser.parseInt(map['entity_id']),
      broadcastId: DynamicParser.parseInt(map['broadcast_id']),
      isRead: DynamicParser.parseInt(map['is_read']) == 1,
      createdAt: DynamicParser.tryParseUtc(map['created_at']),
      type: DynamicParser.parseInt(map['type']),
      actionUrl: map['action_url'],
      image: map['images'],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      content,
      title,
      targetType,
      entityId,
      broadcastId,
      isRead,
      type,
      actionUrl,
      image,
    ];
  }
}
