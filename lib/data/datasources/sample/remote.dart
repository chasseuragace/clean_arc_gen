import '../../../core/errors/exceptions.dart';
import '../../../core/network/api_service/api_service.dart';
import '../../models/sample/sample_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SampleRemoteDataSource {
  Future<List<SampleModel>> getSamples({
    required int page,
    required int take,
    required Map<String, dynamic> params,
  });
}

class SampleRemoteDataSourceImpl implements SampleRemoteDataSource {
  SampleRemoteDataSourceImpl({required this.api});
  final ApiManager api;
  final String getSamplesEndpoint = '';

  @override
  Future<List<SampleModel>> getSamples({
    required int page,
    required int take,
    required Map<String, dynamic> params,
  }) async {
    final response = await api.get(
      getSamplesEndpoint,
      queryParameters: {
        'page': page,
        'take': take,
        ...params,
      },
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => SampleModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

final remoteSampleDataSourceProvider =
    Provider<SampleRemoteDataSourceImpl>((ref) {
  return SampleRemoteDataSourceImpl(api: ref.read(apiProvider));
});
