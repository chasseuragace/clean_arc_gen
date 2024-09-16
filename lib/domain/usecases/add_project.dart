import 'package:dartz/dartz.dart';
import '../entities/Project_entity.dart';
import '../repositories/Project_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class AddProject implements UseCase<Unit, ProjectEntity> {
  final ProjectRepository repository;

  AddProject(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ProjectEntity entity) async {
    return  repository.addItem(entity);
  }
}
