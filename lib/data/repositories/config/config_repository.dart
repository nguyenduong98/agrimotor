import '../../../core/core.dart';
import '../../sources/sources.dart';
import '../repositories.dart';
part 'config_repository_impl.dart';

abstract class ConfigRepository {
  Future<void> init();
  Future<bool> isFirstLaunch();
}
