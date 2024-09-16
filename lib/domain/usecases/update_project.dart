import 'package:dartz/dartz.dart';
import '../entities/Project_entity.dart';
import '../repositories/Project_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class UpdateProject implements UseCase<Unit, ProjectEntity> {
  final ProjectRepository repository;

  UpdateProject(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ProjectEntity entity) async {
    return  repository.updateItem(entity);
  }
}
