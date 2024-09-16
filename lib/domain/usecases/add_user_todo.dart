import 'package:dartz/dartz.dart';
import '../entities/UserTodo_entity.dart';
import '../repositories/UserTodo_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class AddUserTodo implements UseCase<Unit, UserTodoEntity> {
  final UserTodoRepository repository;

  AddUserTodo(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserTodoEntity entity) async {
    return  repository.addItem(entity);
  }
}
