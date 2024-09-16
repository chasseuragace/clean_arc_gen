import '../../../core/errors/failures.dart';
import '../../entities/sample/sample_entity.dart';
import '../base_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SmapleRepo extends BaseRepository {
  Future<Either<Failure, List<SamplEntity>>> fetchData(String endpoint);
}
