import 'package:dartz/dartz.dart';
import '../entities/UserTodo_entity.dart';
import '../repositories/UserTodo_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class UpdateUserTodo implements UseCase<Unit, UserTodoEntity> {
  final UserTodoRepository repository;

  UpdateUserTodo(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserTodoEntity entity) async {
    return  repository.updateItem(entity);
  }
}
