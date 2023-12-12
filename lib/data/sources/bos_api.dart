import 'package:retrofit/retrofit.dart';
import '../../core/core.dart' hide Headers;
import '../entities/entities.dart';

part 'bos_api.g.dart';

@RestApi()
abstract class BosApi {
  factory BosApi(Dio dio, {String baseUrl}) = _BosApi;

  @GET('/{storeCode}/V1/store/list')
  Future<List<StoreBranch>> getStores({
    @Path('storeCode') required String storeCode,
  });
}
