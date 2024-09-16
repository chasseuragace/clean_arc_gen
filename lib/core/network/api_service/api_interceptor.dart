import '../../../data/datasources/local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [ApiInterceptor] : Intercepts requests, before request and adds required headers
class ApiInterceptor extends Interceptor {
  ApiInterceptor({required this.localStorageService});
  // final TokenManager tokenManager;
  final LocalDataSourceImpl localStorageService;

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = localStorageService.getCachedData('TOKEN');
    options.headers = {
      ...options.headers,
      'content-type': 'application/json',
    };
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final responseData = err.response?.data;

    if (responseData is Map) {
      if (responseData['message'] == 'Unauthorized') {
        // tokenManager.clearAuthToken();
        // return;
      }
    }
    super.onError(err, handler);
  }
}

final tokenInterceptorProvider = Provider(
  (ref) =>
      ApiInterceptor(localStorageService: ref.read(localDataSourceProvider)),
);
