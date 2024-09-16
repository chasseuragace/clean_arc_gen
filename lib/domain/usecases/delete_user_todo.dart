import 'package:dartz/dartz.dart';
import '../repositories/UserTodo_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class DeleteUserTodo implements UseCase<Unit, String> {
  final UserTodoRepository repository;

  DeleteUserTodo(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return  repository.deleteItem(id);
  }
}
