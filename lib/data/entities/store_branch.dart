part of 'entities.dart';

class StoreBranch extends Equatable {
  final String? name;
  final String? storeCode;
  final String? storeAddress;
  final List<EventStore>? eventStores;

  const StoreBranch({
    this.name,
    this.storeCode,
    this.storeAddress,
    this.eventStores,
  });

  StoreBranch copyWith({
    String? name,
    String? storeCode,
    String? storeAddress,
    List<EventStore>? eventStores,
  }) {
    return StoreBranch(
      name: name ?? this.name,
      storeCode: storeCode ?? this.storeCode,
      storeAddress: storeAddress ?? this.storeAddress,
      eventStores: eventStores ?? this.eventStores,
    );
  }

  factory StoreBranch.fromJson(Map<String, dynamic> map) {
    return StoreBranch(
      name: map['name'],
      storeCode: map['store_code'],
      storeAddress: map['store_address'],
      eventStores: map['list_event_store'] != null
          ? (map['list_event_store'] as List)
              .map((e) => EventStore.fromJson(e))
              .toList()
          : null,
    );
  }

  @override
  List<Object?> get props => [
        name,
        storeCode,
        name,
      ];
}
