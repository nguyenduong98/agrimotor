part of 'utils.dart';

extension IterableExtensions<T> on Iterable<T> {
  Iterable<List<T>> chunks(int size) {
    return partition(this, size);
  }

  T? findByIndex(int index) => firstWhereIndexedOrNull((i, _) => i == index);
}

extension NullableListEx<T> on List<T>? {
  bool isNotNullAndNotEmpty() => this?.isNotEmpty ?? false;

  T? getFirstOrNull() => isNotNullAndNotEmpty() ? this!.first : null;
}
