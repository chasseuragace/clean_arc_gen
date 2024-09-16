import 'package:dartz/dartz.dart';
import '../entities/Project_entity.dart';
import '../repositories/Project_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class GetProjectById implements UseCase<ProjectEntity?, String> {
  final ProjectRepository repository;

  GetProjectById(this.repository);

  @override
  Future<Either<Failure, ProjectEntity?>> call(String id) async {
    return  repository.getItemById(id);
  }
}
