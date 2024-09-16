import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/Userlist/entity.dart';
import '../../../domain/repositories/Userlist/repository.dart';
import '../../datasources/Userlist/local_data_source.dart';
import '../../datasources/Userlist/remote_data_source.dart';
import '../../models/Userlist/model.dart';
class UserlistRepositoryImpl implements UserlistRepository {
  final UserlistLocalDataSource localDataSource;
  final UserlistRemoteDataSource remoteDataSource;

  UserlistRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserlistEntity>>> getAllItems() async {
    try {
      final remoteItems = await remoteDataSource.getAllItems();
      return right(remoteItems);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserlistEntity?>> getItemById(String id) async {
    try {
      final remoteItem = await remoteDataSource.getItemById(id);
      return right(remoteItem);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addItem(UserlistEntity entity) async {
    try {
      await remoteDataSource.addItem((entity as UserlistModel).toModel());
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateItem(UserlistEntity entity) async {
    try {
      await remoteDataSource.updateItem((entity as UserlistModel).toModel());
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
extension model on UserlistEntity {
  UserlistModel toModel() {
    throw UnimplementedError();
  }
}
