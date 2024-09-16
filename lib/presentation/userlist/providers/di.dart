import '../../../data/datasources/Userlist/local_data_source.dart';
import '../../../data/datasources/Userlist/remote_data_source.dart';
import '../../../data/repositories/Userlist/repository_impl.dart';
import '../../../data/repositories/Userlist/repository_impl_fake.dart';
import '../../../domain/usecases/Userlist/get_all.dart';
import '../../../domain/usecases/Userlist/get_by_id.dart';
import '../../../domain/usecases/Userlist/add.dart';
import '../../../domain/usecases/Userlist/update.dart';
import '../../../domain/usecases/Userlist/delete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllUserlistUseCaseProvider = Provider<GetAllUserlistUseCase>((ref) {
  return GetAllUserlistUseCase(ref.watch(rUserlistRepositoryProvider));
});

final getUserlistByIdUseCaseProvider = Provider<GetUserlistByIdUseCase>((ref) {
  return GetUserlistByIdUseCase(ref.watch(rUserlistRepositoryProvider));
});

final addUserlistUseCaseProvider = Provider<AddUserlistUseCase>((ref) {
  return AddUserlistUseCase(ref.watch(rUserlistRepositoryProvider));
});

final updateUserlistUseCaseProvider = Provider<UpdateUserlistUseCase>((ref) {
  return UpdateUserlistUseCase(ref.watch(rUserlistRepositoryProvider));
});

final deleteUserlistUseCaseProvider = Provider<DeleteUserlistUseCase>((ref) {
  return DeleteUserlistUseCase(ref.watch(rUserlistRepositoryProvider));
});

final rUserlistRepositoryProvider = Provider((ref) {
  final local = ref.read(localDataUserlistSourceProvider);
  final remote = ref.read(remoteDataUserlistSourceProvider);
  return UserlistRepositoryFake(localDataSource: local, remoteDataSource: remote);
});

final localDataUserlistSourceProvider = Provider<UserlistLocalDataSource>((ref) {
  return UserlistLocalDataSourceImpl();
});

final remoteDataUserlistSourceProvider = Provider<UserlistRemoteDataSource>((ref) {
  return UserlistRemoteDataSourceImpl();
});
