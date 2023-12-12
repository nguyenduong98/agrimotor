part of 'entities.dart';

class EventStore {
  final Map<String, dynamic> _data;

  const EventStore._(this._data);

  String? get code => _data['event_code'];
  String? name(String locale) => _data['event_name_$locale'];
  String? address(String locale) => _data['store_address_$locale'];

  factory EventStore.fromJson(Map<String, dynamic> map) {
    return EventStore._(map);
  }
}
