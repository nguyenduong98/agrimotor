import 'package:fresh_dio/fresh_dio.dart';
import '../../core/core.dart';
import '../models/models.dart';

export 'auth/auth_repository.dart';
export 'config/config_repository.dart';

abstract class BaseRepository {
  Future<T> request<T>(Future Function() call) async {
    final result = await requestNullable(call);
    if (result != null) return result;
    throw ServiceException.resultNull();
  }

  Future<T?> requestNullable<T>(Future Function() call) async {
    try {
      final hasInternet = await NetworkUtil.instance.hasInternet();
      if (!hasInternet) throw NoInternetException();
      return await call();
    } on DioError catch (error) {
      if (error.type == DioErrorType.response) {
        handleDioErrorResponse(error);
        return null;
      } else if (error.error is RevokeTokenException) {
        throw UnAuthorizeException();
      } else {
        final eType = error.type;

        String msgCode = 'dioOther';
        if (eType == DioErrorType.cancel) msgCode = 'dioCancel';
        if (eType == DioErrorType.connectTimeout) msgCode = 'dioConnectTimeout';
        if (eType == DioErrorType.receiveTimeout) msgCode = 'dioReceiveTimeout';
        if (eType == DioErrorType.sendTimeout) msgCode = 'dioSendTimeout';

        throw ServiceException(
          null,
          msgCode,
          error.response?.statusCode,
        );
      }
    } on NoInternetException {
      rethrow;
    } on UnAuthorizeException {
      rethrow;
    } on RevokeTokenException {
      throw UnAuthorizeException();
    } on ServiceException {
      rethrow;
    } catch (error) {
      throw ServiceException.unknow();
    }
  }

  void handleDioErrorResponse(DioError error) {
    if (error.response?.statusCode == 401) {
      //
      final response = error.response?.data;
      final errorModel = (response != null && response is Map)
          ? ErrorModel.fromJson(response as Map<String, dynamic>)
          : null;
      //
      throw UnAuthorizeException(errorModel?.message);
    }
    if (error.response?.statusCode == 500) {
      throw ServiceException.internalServerError();
    }
    if (error.response?.statusCode == 502) {
      throw ServiceException.internalServerError();
    }
    if (error.response?.statusCode == 503) {
      throw ServiceException.serverMaintenanceError();
    }
    final response = error.response?.data;
    if (response != null && response is Map) {
      final json = response as Map<String, dynamic>;
      final model = ErrorModel.fromJson(json);
      throw ServiceException(
        model.message,
        null,
        model.code,
      );
    } else if (response is String) {
      final mess = RegExp(Patterns.html).hasMatch(response) ? null : response;
      throw ServiceException(mess);
    } else {
      throw ServiceException.unknow();
    }
  }
}
