import '../../core/config/app_config.dart';
import '../../core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RemoteDataSource {
  Future<dynamic> get(String endpoint);
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl() : _dio = Dio() {
    _dio.options.baseUrl = AppConfig.apiBaseUrl;
    _dio.options.connectTimeout = AppConfig.connectTimeout;
    _dio.options.receiveTimeout = AppConfig.receiveTimeout;
  }
  final Dio _dio;

  @override
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } catch (e) {
      throw ServerException();
    }
  }
}

final remoteDataSourceProvider = Provider<RemoteDataSourceImpl>((ref) {
  return RemoteDataSourceImpl();
});
