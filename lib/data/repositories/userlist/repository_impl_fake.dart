import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/Userlist/entity.dart';
import '../../../domain/repositories/Userlist/repository.dart';
import '../../datasources/Userlist/local_data_source.dart';
import '../../datasources/Userlist/remote_data_source.dart';
import '../../models/Userlist/model.dart';
// Fake data for Userlists
      final remoteItems = [
        UserlistModel(

            rawJson: {},
          id: '1',
          name: 'Admin',
        ),
        UserlistModel(
        rawJson: {},
          id: '2',
          name: 'User',
        ),
        UserlistModel(
        rawJson: {},
          id: '3',
          name: 'Guest',
        ),
      ];
class UserlistRepositoryFake implements UserlistRepository {
  final UserlistLocalDataSource localDataSource;
  final UserlistRemoteDataSource remoteDataSource;

  UserlistRepositoryFake({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserlistEntity>>> getAllItems() async {
    try {
    

      // Simulate delay
      await Future.delayed(Duration(milliseconds: 300));

      return right(remoteItems.map((model) => model).toList());
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserlistEntity?>> getItemById(String id) async {
    try {
    
      // Simulate delay
      await Future.delayed(Duration(milliseconds: 300));

      final remoteItem = remoteItems.firstWhere((item) => item.id == id,
          orElse: () => throw "Not found");
      return right(remoteItem);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addItem(UserlistEntity entity) async {
    try {
      // Simulate delay
      await Future.delayed(Duration(milliseconds: 300));

      // No actual data operation in fake implementation
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateItem(UserlistEntity entity) async {
    try {
      // Simulate delay
      await Future.delayed(Duration(milliseconds: 300));

      // No actual data operation in fake implementation
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem(String id) async {
    try {
      // Simulate delay
      await Future.delayed(Duration(milliseconds: 300));

      // No actual data operation in fake implementation
      return right(unit);
    } catch (error) {
      return left(ServerFailure());
    }
  }
}
