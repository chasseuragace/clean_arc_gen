# **************************************************************************
# * ArchitectureGenerator - Flutter Clean Architecture with Riverpod
# **************************************************************************

#? --> For Info
# NAME will be replaced with the feature name (e.g., "item", "user", etc.)
# funcCase will be used for method names
# LOWER_CASE will be used for file names

# ----Clean Architecture with Riverpod----------------------------> start
generate:
# ---Data------------------------------------------------------
  - category: data
    contents:
      - folder: datasources/NAME
        contents:
          - file: NAME_local_data_source.dart
            code: |
              import '../../models/NAME_model.dart';

              abstract class NAMELocalDataSource {
                Future<List<NAMEModel>> getAllItems();
                Future<NAMEModel?> getItemById(String id);
                Future<void> addItem(NAMEModel model);
                Future<void> updateItem(NAMEModel model);
                Future<void> deleteItem(String id);
              }

              class NAMELocalDataSourceImpl implements NAMELocalDataSource {
                @override
                Future<List<NAMEModel>> getAllItems() async {
                 throw UnimplementedError();
                }

                @override
                Future<NAMEModel?> getItemById(String id) async {
                  // Implementation
                }

                @override
                Future<void> addItem(NAMEModel model) async {
                  // Implementation
                }

                @override
                Future<void> updateItem(NAMEModel model) async {
                  // Implementation
                }

                @override
                Future<void> deleteItem(String id) async {
                  // Implementation
                }
              }
          - file: NAME_remote_data_source.dart
            code: |
              import '../../models/NAME_model.dart';

              abstract class NAMERemoteDataSource {
                Future<List<NAMEModel>> getAllItems();
                Future<NAMEModel?> getItemById(String id);
                Future<void> addItem(NAMEModel model);
                Future<void> updateItem(NAMEModel model);
                Future<void> deleteItem(String id);
              }

              class NAMERemoteDataSourceImpl implements NAMERemoteDataSource {
                @override
                Future<List<NAMEModel>> getAllItems() async {
                 throw UnimplementedError();
                }

                @override
                Future<NAMEModel?> getItemById(String id) async {
                  // Implementation
                }

                @override
                Future<void> addItem(NAMEModel model) async {
                  // Implementation
                }

                @override
                Future<void> updateItem(NAMEModel model) async {
                  // Implementation
                }

                @override
                Future<void> deleteItem(String id) async {
                  // Implementation
                }
              }
      - folder: models
        contents:
          - file: NAME_model.dart
            code: |
                    import '../../domain/entities/NAME_entity.dart';

                    class NAMEModel extends NAMEEntity {
                      NAMEModel({required this.id,  this.name, super.rawJson});

                      factory NAMEModel.fromJson(Map<String, dynamic> json) {
                        return NAMEModel(
                           id: json['id'] as String,
                            name: json['name'] as String?,
                            rawJson: json, // Pass the entire JSON object
                          );
                      }
                      final String id;
                      final String? name;

                      Map<String, dynamic> toJson() {
                        return {
                          'id': id,
                          'name': name,
                        };
                      }
                    }

      - folder: repositories/NAME
        contents:
          - file: NAME_repository_impl.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../../../domain/entities/NAME_entity.dart';
              import '../../../domain/repositories/NAME_repository.dart';
              import '../../../core/errors/failures.dart';
              import '../../datasources/NAME/NAME_local_data_source.dart';
              import '../../datasources/NAME/NAME_remote_data_source.dart';
              import '../../models/NAME_model.dart';

              class NAMERepositoryImpl implements NAMERepository {
                final NAMELocalDataSource localDataSource;
                final NAMERemoteDataSource remoteDataSource;

                NAMERepositoryImpl({
                  required this.localDataSource,
                  required this.remoteDataSource,
                });

                @override
                Future<Either<Failure, List<NAMEEntity>>> getAllItems() async {
                  try {
                    final remoteItems = await remoteDataSource.getAllItems();
                    return right(remoteItems.map((model) => NAMEModel(id: model.id, /* other fields */)).toList());
                  } catch (error) {
                    return left(ServerFailure());
                  }
                }

                @override
                Future<Either<Failure, NAMEEntity?>> getItemById(String id) async {
                  try {
                    final remoteItem = await remoteDataSource.getItemById(id);
                    return right(remoteItem != null ? NAMEModel(id: remoteItem.id, /* other fields */) : null);
                  } catch (error) {
                    return left(ServerFailure());
                  }
                }

                @override
                Future<Either<Failure, Unit>> addItem(NAMEEntity entity) async {
                  try {
                    await remoteDataSource.addItem((entity as NAMEModel).toModel());
                    return right(unit);
                  } catch (error) {
                    return left(ServerFailure());
                  }
                }

                @override
                Future<Either<Failure, Unit>> updateItem(NAMEEntity entity) async {
                  try {
                    await remoteDataSource.updateItem((entity as NAMEModel).toModel());
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
              extension model on NAMEEntity {
                NAMEModel toModel() {
                  throw UnimplementedError();
                }
              }
# ---Domain----------------------------------------------------
  - category: domain
    contents:
      - folder: entities
        contents:
          - file: NAME_entity.dart
            code: |
              
              import 'base_entity.dart';

              abstract class NAMEEntity extends BaseEntity {
                NAMEEntity({super.rawJson});
              }


      - folder: repositories
        contents:
          - file: NAME_repository.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../entities/NAME_entity.dart';
              import '../../core/errors/failures.dart';

              abstract class NAMERepository {
                Future<Either<Failure, List<NAMEEntity>>> getAllItems();
                Future<Either<Failure, NAMEEntity?>> getItemById(String id);
                Future<Either<Failure, Unit>> addItem(NAMEEntity entity);
                Future<Either<Failure, Unit>> updateItem(NAMEEntity entity);
                Future<Either<Failure, Unit>> deleteItem(String id);
              }
      - folder: usecases
        contents:
          - file: get_all_NAMEUseCase.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../entities/NAME_entity.dart';
              import '../repositories/NAME_repository.dart';
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';

              class GetAllNAME implements UseCase<List<NAMEEntity>, NoParm> {
                final NAMERepository repository;

                GetAllNAME(this.repository);

                @override
                Future<Either<Failure, List<NAMEEntity>>> call(NoParm params) async {
                  return  repository.getAllItems();
                }
              }
          - file: get_NAME_by_id.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../entities/NAME_entity.dart';
              import '../repositories/NAME_repository.dart';
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';

              class GetNAMEByIdUseCase implements UseCase<NAMEEntity?, String> {
                final NAMERepository repository;

                GetNAMEById(this.repository);

                @override
                Future<Either<Failure, NAMEEntity?>> call(String id) async {
                  return  repository.getItemById(id);
                }
              }
          - file: add_NAME.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../entities/NAME_entity.dart';
              import '../repositories/NAME_repository.dart';
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';

              class AddNAMEUseCase implements UseCase<Unit, NAMEEntity> {
                final NAMERepository repository;

                AddNAME(this.repository);

                @override
                Future<Either<Failure, Unit>> call(NAMEEntity entity) async {
                  return  repository.addItem(entity);
                }
              }
          - file: update_NAME.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../entities/NAME_entity.dart';
              import '../repositories/NAME_repository.dart';
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';

              class UpdateNAMEUseCase implements UseCase<Unit, NAMEEntity> {
                final NAMERepository repository;

                UpdateNAME(this.repository);

                @override
                Future<Either<Failure, Unit>> call(NAMEEntity entity) async {
                  return  repository.updateItem(entity);
                }
              }
          - file: delete_NAME.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../repositories/NAME_repository.dart';
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';

              class DeleteNAMEUseCase implements UseCase<Unit, String> {
                final NAMERepository repository;

                DeleteNAME(this.repository);

                @override
                Future<Either<Failure, Unit>> call(String id) async {
                  return  repository.deleteItem(id);
                }
              }
# ---Presentation----------------------------------------------
  - category: presentation
    contents:
      - folder: providers
        contents:
          - file: NAME_provider.dart
            code: |
              import '../../core/errors/failures.dart';
              import '../../core/usecases/usecase.dart';
              import '../../domain/entities/NAME_entity.dart';
              import '../../domain/usecases/get_all_NAME.dart';
              import '../../domain/usecases/get_NAME_by_id.dart';
              import '../../domain/usecases/add_NAME.dart';
              import '../../domain/usecases/update_NAME.dart';
              import '../../domain/usecases/delete_NAME.dart';
              import 'package:flutter_riverpod/flutter_riverpod.dart';
              import 'package:dartz/dartz.dart';

              class NAMENotifier extends StateNotifier<AsyncValue<List<NAMEEntity>>> {
                final GetAllNAME _getAllNAME;
                final GetNAMEById _getNAMEById;
                final AddNAME _addNAME;
                final UpdateNAME _updateNAME;
                final DeleteNAME _deleteNAME;

                NAMENotifier(
                  this._getAllNAME,
                  this._getNAMEById,
                  this._addNAME,
                  this._updateNAME,
                  this._deleteNAME,
                ) : super(const AsyncValue.loading());

                Future<void> loadItems() async {
                  state = const AsyncValue.loading();
                  final result = await _getAllNAME(NoParm() );
                  state = result.fold(
                    (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
                    (items) => AsyncValue.data(items),
                  );
                }

                Future<void> loadItemById(String id) async {
                  final result = await _getNAMEById(id);
                  state = result.fold(
                    (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
                    (item) => AsyncValue.data(item != null ? [item] : []), // Assuming single item
                  );
                }

                Future<void> addItem(NAMEEntity item) async {
                  final result = await _addNAME(item);
                  state = result.fold(
                    (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
                    (_) => state,
                  );
                }

                Future<void> updateItem(NAMEEntity item) async {
                  final result = await _updateNAME(item);
                  state = result.fold(
                    (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
                    (_) => state,
                  );
                }

                Future<void> deleteItem(String id) async {
                  final result = await _deleteNAME(id);
                  state = result.fold(
                    (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
                    (_) => state,
                  );
                }

                String _mapFailureToMessage(Failure failure) {
                  if (failure is ServerFailure) {
                    return 'Server failure';
                  } else if (failure is CacheFailure) {
                    return 'Cache failure';
                  } else {
                    return 'Unexpected error';
                  }
                }
              }

              final pNAMENotifierProvider = StateNotifierProvider<NAMENotifier, AsyncValue<List<NAMEEntity>>>((ref) {
                final getAllNAME = ref.watch(getAllNAMEProvider);
                final getNAMEById = ref.watch(getNAMEByIdProvider);
                final addNAME = ref.watch(addNAMEProvider);
                final updateNAME = ref.watch(updateNAMEProvider);
                final deleteNAME = ref.watch(deleteNAMEProvider);

                return NAMENotifier(getAllNAME, getNAMEById, addNAME, updateNAME, deleteNAME);
              });

              final getAllNAMEProvider = Provider<GetAllNAME>((ref) {
                return GetAllNAME(ref.watch(rNAMERepositoryProvider));
              });

              final getNAMEByIdProvider = Provider<GetNAMEById>((ref) {
                return GetNAMEById(ref.watch(rNAMERepositoryProvider));
              });

              final addNAMEProvider = Provider<AddNAME>((ref) {
                return AddNAME(ref.watch(rNAMERepositoryProvider));
              });

              final updateNAMEProvider = Provider<UpdateNAME>((ref) {
                return UpdateNAME(ref.watch(rNAMERepositoryProvider));
              });

              final deleteNAMEProvider = Provider<DeleteNAME>((ref) {
                return DeleteNAME(ref.watch(rNAMERepositoryProvider));
              });
# ---Core------------------------------------------------------
  - category: core
    contents:
      - folder: errors
        contents:
          - file: failures.dart
            code: |
              abstract class Failure {}

              class ServerFailure extends Failure {}

              class CacheFailure extends Failure {}

              class UnexpectedFailure extends Failure {}

      - folder: usecases
        contents:
          - file: usecase.dart
            code: |
              import 'package:dartz/dartz.dart';
              import '../errors/failures.dart';

              abstract class UseCase<Type, Params> {
                Future<Either<Failure, Type>> call(Params params);
              }
              class NoParm {}
              abstract class BaseRepository {}
# --------------------------------------------------------------------------
# End of Template
# --------------------------------------------------------------------------
