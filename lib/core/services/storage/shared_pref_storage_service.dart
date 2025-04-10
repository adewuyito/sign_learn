import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_learn/core/services/storage/storage_service.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // TODO: Fix this side;
});

final sharedPrefStorageProvider = Provider<StorageService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return SharedPrefStorageService(sharedPreferences);
});

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
