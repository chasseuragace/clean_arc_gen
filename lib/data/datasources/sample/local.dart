import 'dart:convert';
import '../../../core/errors/exceptions.dart';
import '../local_data_source.dart';
import '../../models/sample/sample_model.dart';
import '../../../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SampleLocalDataSource extends LocalDataSource {
  List<SampleModel> getSample();
  Future<void> cacheSample(List<SampleModel> wallpapers);
}

class SampleLocalDataSourceImpl implements SampleLocalDataSource {
  SampleLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  List<SampleModel> getSample() {
    final jsonString = sharedPreferences.getString('CACHED_SAMPLES');
    if (jsonString != null) {
      return (json.decode(jsonString) as List)
          .map<SampleModel>(
            (json) => SampleModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSample(List<SampleModel> wallpapers) {
    return sharedPreferences.setString(
      'CACHED_SAMPLE',
      json.encode(wallpapers.map((wallpaper) => wallpaper.toJson()).toList()),
    );
  }

  @override
  Future<void> cacheData(String key, String value) {
    throw UnimplementedError();
  }

  @override
  String? getCachedData(String key) {
    throw UnimplementedError();
  }
}

final localSampleDataSourceProvider =
    Provider<SampleLocalDataSourceImpl>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).value;
  if (sharedPreferences == null) {
    throw UnimplementedError('SharedPreferences not initialized');
  }
  return SampleLocalDataSourceImpl(sharedPreferences: sharedPreferences);
});
