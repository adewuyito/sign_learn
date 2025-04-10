abstract class StorageService {
  /// removes a stored value from the storage
  Future<void> remove(String key);

  /// retrives a store value from the storage
  dynamic get(String key);

  /// stores a vlaue in the storage
  Future<void> set(String key, dynamic data);

  /// clears the storage
  Future<void> clear();
}
