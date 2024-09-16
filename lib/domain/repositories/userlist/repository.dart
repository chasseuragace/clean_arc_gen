import 'package:dartz/dartz.dart';
import '../../entities/Userlist/entity.dart';
import '../../../core/errors/failures.dart';

abstract class UserlistRepository {
  Future<Either<Failure, List<UserlistEntity>>> getAllItems();
  Future<Either<Failure, UserlistEntity?>> getItemById(String id);
  Future<Either<Failure, Unit>> addItem(UserlistEntity entity);
  Future<Either<Failure, Unit>> updateItem(UserlistEntity entity);
  Future<Either<Failure, Unit>> deleteItem(String id);
}
