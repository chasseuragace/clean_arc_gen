import '../../core/util/logger.dart';
import '../../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> cacheData(String key, String value);
  String? getCachedData(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  @override
  Future<void> cacheData(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  String? getCachedData(String key) {
    final data = sharedPreferences.getString(key);
    if (data != null) {
      return data;
    } else {
      logger.i('cache was null for $key');
      return null;
    }
  }
}

final localDataSourceProvider = Provider<LocalDataSourceImpl>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  if (sharedPreferences == null) {
    throw UnimplementedError('SharedPreferences not initialized');
  }
  return LocalDataSourceImpl(sharedPreferences);
});
