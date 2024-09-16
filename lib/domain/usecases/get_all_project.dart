import 'package:dartz/dartz.dart';
import '../entities/Project_entity.dart';
import '../repositories/Project_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class GetAllProject implements UseCase<List<ProjectEntity>, NoParm> {
  final ProjectRepository repository;

  GetAllProject(this.repository);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParm params) async {
    return  repository.getAllItems();
  }
}
