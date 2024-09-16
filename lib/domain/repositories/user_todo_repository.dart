import 'package:dartz/dartz.dart';
import '../entities/UserTodo_entity.dart';
import '../../core/errors/failures.dart';

abstract class UserTodoRepository {
  Future<Either<Failure, List<UserTodoEntity>>> getAllItems();
  Future<Either<Failure, UserTodoEntity?>> getItemById(String id);
  Future<Either<Failure, Unit>> addItem(UserTodoEntity entity);
  Future<Either<Failure, Unit>> updateItem(UserTodoEntity entity);
  Future<Either<Failure, Unit>> deleteItem(String id);
}
