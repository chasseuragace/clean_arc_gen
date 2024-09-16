import '../../../domain/entities/base_entity.dart';
import '../../../domain/usecases/sample/fetch_sample_data_usecase.dart';
import '../base_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleNotifier extends BaseNotifier<List<BaseEntity>> {
  SampleNotifier(this.fetchSampleDataUseCase) : super() {
    // fetchData('endpoint');
  }
  final FetchSampleDataUseCase fetchSampleDataUseCase;

  Future<void> fetchData(String endpoint) async {
    setLoading();
    final result = await fetchSampleDataUseCase(endpoint);
    result.fold(
      (failure) => setError(failure, StackTrace.current),
      setData,
    );
  }
}

final sampleNotifierProvider =
    StateNotifierProvider<SampleNotifier, AsyncValue<List<BaseEntity>>>((ref) {
  final fetchSampleDataUseCase = ref.watch(fetchSampleDataUseCaseProvider);
  return SampleNotifier(fetchSampleDataUseCase);
});
