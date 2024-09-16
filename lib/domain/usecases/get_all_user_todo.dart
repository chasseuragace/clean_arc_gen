import 'package:dartz/dartz.dart';
import '../entities/UserTodo_entity.dart';
import '../repositories/UserTodo_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class GetAllUserTodo implements UseCase<List<UserTodoEntity>, NoParm> {
  final UserTodoRepository repository;

  GetAllUserTodo(this.repository);

  @override
  Future<Either<Failure, List<UserTodoEntity>>> call(NoParm params) async {
    return  repository.getAllItems();
  }
}
