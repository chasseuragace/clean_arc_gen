import 'package:clean_code/core/errors/failures.dart';
import 'package:clean_code/core/usecases/usecase.dart';
import 'package:clean_code/domain/entities/UserTodo_entity.dart';
import 'package:clean_code/domain/usecases/get_all_UserTodo.dart';
import 'package:clean_code/domain/usecases/get_UserTodo_by_id.dart';
import 'package:clean_code/domain/usecases/add_UserTodo.dart';
import 'package:clean_code/domain/usecases/update_UserTodo.dart';
import 'package:clean_code/domain/usecases/delete_UserTodo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

class UserTodoNotifier extends StateNotifier<AsyncValue<List<UserTodoEntity>>> {
  final GetAllUserTodo _getAllUserTodo;
  final GetUserTodoById _getUserTodoById;
  final AddUserTodo _addUserTodo;
  final UpdateUserTodo _updateUserTodo;
  final DeleteUserTodo _deleteUserTodo;

  UserTodoNotifier(
    this._getAllUserTodo,
    this._getUserTodoById,
    this._addUserTodo,
    this._updateUserTodo,
    this._deleteUserTodo,
  ) : super(const AsyncValue.loading());

  Future<void> loadItems() async {
    state = const AsyncValue.loading();
    final result = await _getAllUserTodo(NoParm() );
    state = result.fold(
      (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
      (items) => AsyncValue.data(items),
    );
  }

  Future<void> loadItemById(String id) async {
    final result = await _getUserTodoById(id);
    state = result.fold(
      (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
      (item) => AsyncValue.data(item != null ? [item] : []), // Assuming single item
    );
  }

  Future<void> addItem(UserTodoEntity item) async {
    final result = await _addUserTodo(item);
    state = result.fold(
      (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
      (_) => state,
    );
  }

  Future<void> updateItem(UserTodoEntity item) async {
    final result = await _updateUserTodo(item);
    state = result.fold(
      (failure) => AsyncValue.error(_mapFailureToMessage(failure),StackTrace.current),
      (_) => state,
    );
  }

  Future<void> deleteItem(String id) async {
    final result = await _deleteUserTodo(id);
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

final UserTodoNotifierProvider = StateNotifierProvider<UserTodoNotifier, AsyncValue<List<UserTodoEntity>>>((ref) {
  final getAllUserTodo = ref.watch(getAllUserTodoProvider);
  final getUserTodoById = ref.watch(getUserTodoByIdProvider);
  final addUserTodo = ref.watch(addUserTodoProvider);
  final updateUserTodo = ref.watch(updateUserTodoProvider);
  final deleteUserTodo = ref.watch(deleteUserTodoProvider);

  return UserTodoNotifier(getAllUserTodo, getUserTodoById, addUserTodo, updateUserTodo, deleteUserTodo);
});

final getAllUserTodoProvider = Provider<GetAllUserTodo>((ref) {
  return GetAllUserTodo(ref.watch(UserTodoRepositoryProvider));
});

final getUserTodoByIdProvider = Provider<GetUserTodoById>((ref) {
  return GetUserTodoById(ref.watch(UserTodoRepositoryProvider));
});

final addUserTodoProvider = Provider<AddUserTodo>((ref) {
  return AddUserTodo(ref.watch(UserTodoRepositoryProvider));
});

final updateUserTodoProvider = Provider<UpdateUserTodo>((ref) {
  return UpdateUserTodo(ref.watch(UserTodoRepositoryProvider));
});

final deleteUserTodoProvider = Provider<DeleteUserTodo>((ref) {
  return DeleteUserTodo(ref.watch(UserTodoRepositoryProvider));
});
