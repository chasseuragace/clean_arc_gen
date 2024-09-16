import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

import '../../entities/sample/sample_entity.dart';
import '../../repositories/sample/sample_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FetchSampleDataUseCase implements UseCase<List<SamplEntity>, String> {
  FetchSampleDataUseCase(this.repository);
  final SmapleRepo repository;

  @override
  Future<Either<Failure, List<SamplEntity>>> call(String params) async {
    return await repository.fetchData(params);
  }
}

final fetchSampleDataUseCaseProvider = Provider((ref) {
  throw UnimplementedError();
  // final sampleRepo = ref.watch(sampleRepositoryProvider);
  // return FetchSampleDataUseCase(sampleRepo);
});
