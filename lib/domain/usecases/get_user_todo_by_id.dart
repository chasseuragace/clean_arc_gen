import 'package:dartz/dartz.dart';
import '../entities/UserTodo_entity.dart';
import '../repositories/UserTodo_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class GetUserTodoById implements UseCase<UserTodoEntity?, String> {
  final UserTodoRepository repository;

  GetUserTodoById(this.repository);

  @override
  Future<Either<Failure, UserTodoEntity?>> call(String id) async {
    return  repository.getItemById(id);
  }
}
