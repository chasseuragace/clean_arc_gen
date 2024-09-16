// Assuming this is defined in your logger.dart file
import '../../core/util/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseNotifier<T> extends StateNotifier<AsyncValue<T>> {
  BaseNotifier() : super(const AsyncValue.loading()) {
    _logState('Initial State');
  }

  void setLoading() {
    state = const AsyncValue.loading();
    _logState('Loading');
  }

  void setError(Object error, StackTrace? stackTrace) {
    state = AsyncValue.error(error, StackTrace.current);
    _logState('Error', error: error, stackTrace: stackTrace);
  }

  void setData(T data) {
    state = AsyncValue.data(data);
    _logState('Data', data: data);
  }

  void _logState(
    String status, {
    Object? error,
    StackTrace? stackTrace,
    T? data,
  }) {
    logger.d('$T State: $status');
    if (error != null) {
      logger.e('Error: $error', error: error, stackTrace: stackTrace);
    }
    if (data != null) {
      logger.i('Data: $data');
    }
  }
}
