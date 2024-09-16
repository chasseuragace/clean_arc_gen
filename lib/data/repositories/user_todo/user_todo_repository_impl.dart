import 'package:dartz/dartz.dart';
import '../../../domain/entities/UserTodo_entity.dart';
import '../../../domain/repositories/UserTodo_repository.dart';
import '../../../core/errors/failures.dart';
import '../../datasources/UserTodo/UserTodo_local_data_source.dart';
import '../../datasources/UserTodo/UserTodo_remote_data_source.dart';
import '../../models/UserTodo_model.dart';

class UserTodoRepositoryImpl implements UserTodoRepository {
  final UserTodoLocalDataSource localDataSource;
  final UserTodoRemoteDataSource remoteDataSource;

  UserTodoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserTodoEntity>>> getAllItems() async {
    try {
      final remoteItems = await remoteDataSource.getAllItems();
      return right(remoteItems.map((model) => UserTodoModel(id: model.id, /* other fields */)).toList());
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserTodoEntity?>> getItemById(String id) async {
    try {
      final remoteItem = await remoteDataSource.getItemById(id);
      return right(remoteItem != null ? UserTodoModel(id: remoteItem.id, /* other fields */) : null);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addItem(UserTodoEntity entity) async {
    try {
      await remoteDataSource.addItem((entity as UserTodoModel).toModel());
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateItem(UserTodoEntity entity) async {
    try {
      await remoteDataSource.updateItem((entity as UserTodoModel).toModel());
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem(String id) async {
    try {
      await remoteDataSource.deleteItem(id);
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }
}
extension model on UserTodoEntity {
  UserTodoModel toModel() {
    throw UnimplementedError();
  }
}
