import 'package:riverpod/riverpod.dart';

final dictionaryLocalSourcesProvider = Provider<IDictionaryLocalSources>((ref) {
  return DictionaryLocalSources(ref);
});

abstract class IDictionaryLocalSources {}

class DictionaryLocalSources implements IDictionaryLocalSources {
  Ref ref;
  DictionaryLocalSources(this.ref);
}
