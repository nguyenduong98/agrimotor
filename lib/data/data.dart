library data;

export 'entities/entities.dart';
export 'repositories/repositories.dart';
export 'sources/sources.dart';
export 'models/models.dart';

class Pagination {
  Pagination._();

  static const defaultPageStart = 1;

  static const defaultPageSize = 10;
}
