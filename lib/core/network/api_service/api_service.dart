import '../../config/app_config.dart';
import 'api_interceptor.dart';
import '../../util/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Class [ApiManager]
///
/// A wrapper for managing CRUD actions using dio.
/// Used by repositories.
class ApiManager {
  ApiManager(ProviderRef ref) {
    final options = BaseOptions(
      baseUrl: Constants.apiBaseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      sendTimeout: AppConfig.connectTimeout,
      contentType: Headers.jsonContentType,
    );

    dio = Dio(options);
    dio.interceptors.addAll([
      ref.read(tokenInterceptorProvider),
    ]);
  }

  /// Dio instance used for API requests.
  late Dio dio;

  /// Method [get]
  ///
  /// Method for GET requests.
  Future<Response<T>> get<T>(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Method [post]
  ///
  /// Method for POST requests.
  Future<Response<T>> post<T>(
    String path, {
    data,
    Options? options,
  }) {
    return dio.post(path, data: data, options: options);
  }

  /// Method [put]
  ///
  /// Method for PUT requests.
  Future<Response<T>> put<T>(String path, {data, Options? options}) {
    return dio.put(path, data: data, options: options);
  }

  /// Method [patch]
  ///
  /// Method for PATCH requests.
  Future<Response<T>> patch<T>(String path, {data, Options? options}) {
    return dio.patch(path, data: data, options: options);
  }

  /// Method [delete]
  ///
  /// Method for DELETE requests.
  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Method [fileUpload]
  ///
  /// Uploads a file or files to server using [FormData] and sets the necessary
  /// headers
  Future<Response<T>> fileUpload<T>(String path, {FormData? data}) async {
    return post(
      path,
      options: Options(
        headers: {
          'enctype': 'multipart/form-data',
        },
      ),
      data: data,
    );
  }
}

final apiProvider = Provider((ref) {
  return ApiManager(ref);
});
