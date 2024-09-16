import 'package:dartz/dartz.dart';
import '../entities/Project_entity.dart';
import '../../core/errors/failures.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getAllItems();
  Future<Either<Failure, ProjectEntity?>> getItemById(String id);
  Future<Either<Failure, Unit>> addItem(ProjectEntity entity);
  Future<Either<Failure, Unit>> updateItem(ProjectEntity entity);
  Future<Either<Failure, Unit>> deleteItem(String id);
}
