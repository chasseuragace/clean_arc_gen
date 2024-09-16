import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/Userlist/entity.dart';

import '../../../core/usecases/usecase.dart';
import './di.dart';

class GetAllUserlistNotifier extends AsyncNotifier<List<UserlistEntity>> {
  @override
  Future<List<UserlistEntity>> build() async {
    final result = await ref.read(getAllUserlistUseCaseProvider)(NoParm());
    return result.fold(
      (failure) => throw _mapFailureToException(failure),
      (items) => items,
    );
  }
}

class GetUserlistByIdNotifier extends AsyncNotifier<UserlistEntity?> {
  @override
  Future<UserlistEntity?> build() async {
    return null; // Initially null
  }

  Future<void> getUserlistById(String id) async {
    state = const AsyncValue.loading();
    final result = await ref.read(getUserlistByIdUseCaseProvider)(id);
    state =  result.fold(
      (failure) => AsyncValue.error(failure,StackTrace.current),
      (item) => AsyncValue.data(null),
    );
  }
}

class AddUserlistNotifier extends AsyncNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> addUserlist(UserlistEntity item) async {
    state = const AsyncValue.loading();
    final result = await ref.read(addUserlistUseCaseProvider)(item);
    state = result.fold(
      (failure) => AsyncValue.error(failure,StackTrace.current),
      (_) => AsyncValue.data(null),
   );
    ref.invalidate(getAllUserlistProvider);
  }
}

class UpdateUserlistNotifier extends AsyncNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> updateUserlist(UserlistEntity item) async {
    state = const AsyncValue.loading();
    final result = await ref.read(updateUserlistUseCaseProvider)(item);
    state = result.fold(
      (failure) => AsyncValue.error(failure,StackTrace.current),
      (_) => AsyncValue.data(null),
   );
    ref.invalidate(getAllUserlistProvider);
  }
}

class DeleteUserlistNotifier extends AsyncNotifier {
  @override
  build()  {

  }

  Future<void> delete(String id) async {
    state = const AsyncValue.loading();
    final result = await ref.read(deleteUserlistUseCaseProvider)(id);
    state = result.fold(
      (failure) => AsyncValue.error(failure,StackTrace.current),
      (_) => AsyncValue.data(null),
  );
    ref.invalidate(getAllUserlistProvider);
  }
}

Exception _mapFailureToException(Failure failure) {
  if (failure is ServerFailure) {
    return Exception('Server failure');
  } else if (failure is CacheFailure) {
    return Exception('Cache failure');
  } else {
    return Exception('Unexpected error');
  }
}

final getAllUserlistProvider = AsyncNotifierProvider<GetAllUserlistNotifier, List<UserlistEntity>>(() {
  return GetAllUserlistNotifier();
});

final getUserlistByIdProvider = AsyncNotifierProvider<GetUserlistByIdNotifier, UserlistEntity?>(() {
  return GetUserlistByIdNotifier();
});

final addUserlistProvider = AsyncNotifierProvider<AddUserlistNotifier, void>(() {
  return AddUserlistNotifier();
});

final updateUserlistProvider = AsyncNotifierProvider<UpdateUserlistNotifier, void>(() {
  return UpdateUserlistNotifier();
});

final deleteUserlistProvider = AsyncNotifierProvider<DeleteUserlistNotifier, void>(() {
  return DeleteUserlistNotifier();
});
