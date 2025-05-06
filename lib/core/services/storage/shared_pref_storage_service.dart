import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_learn/core/services/storage/storage_service.dart';

const String lessonLock =  "lesson_lock";
const String onboardingLock = "onBoarding_lock";

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefStorageProvider = Provider<StorageService>((ref) {
  // final sharedPreferences = ref.watch(sharedPreferencesCacheProvider).value;
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  // if (sharedPreferences == null) {
  //   throw Exception('SharedPreferences not initialized');
  // }

  return SharedPrefStorageService(sharedPreferences);
});

// ~ The Commented code is the implementation of the sharedprefrence with caching
/* 

 final sharedPreferencesCacheProvider =
     FutureProvider<SharedPreferencesWithCache>((ref) async {
   return await SharedPreferencesWithCache.create(
     cacheOptions: SharedPreferencesWithCacheOptions(),
  );
});
class SharedPrefStorageService implements StorageService {
  SharedPrefStorageService(this.prefs);

  final SharedPreferencesWithCache prefs;

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  dynamic get(String key) {
    return prefs.get(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> set(String key, dynamic data) async {
    final runTimeType = data.runtimeType;

    switch (runTimeType) {
      // case const (String):
      //   await prefs.setString(key, data);
      //   break;

      case const (int):
        await prefs.setInt(key, data);
        break;

      case const (double):
        await prefs.setDouble(key, data);
        break;

      case const (bool):
        await prefs.setBool(key, data);
        break;

      case const (List<String>):
        await prefs.setStringList(key, data);
        break;
    }
  }
}
*/

class SharedPrefStorageService implements StorageService {
  SharedPrefStorageService(this.prefs);

  final SharedPreferences prefs;

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  dynamic get(String key) {
    return prefs.get(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> set(String key, dynamic data) async {
    final runTimeType = data.runtimeType;

    switch (runTimeType) {
      // case const (String):
      //   await prefs.setString(key, data);
      //   break;

      case const (int):
        await prefs.setInt(key, data);
        break;

      case const (double):
        await prefs.setDouble(key, data);
        break;

      case const (bool):
        await prefs.setBool(key, data);
        break;

      case const (List<String>):
        await prefs.setStringList(key, data);
        break;
    }
  }
}
