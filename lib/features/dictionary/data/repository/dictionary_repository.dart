import 'package:riverpod/riverpod.dart';
import 'package:sign_learn/features/dictionary/data/datasources/dictionary_local_sources.dart';
import 'package:sign_learn/features/dictionary/data/datasources/dictionary_remote_sources.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';

final dictionaryRepositoryProvider = Provider<IDictionaryRepository>((ref) {
  return DictionaryRepository(ref);
});

abstract class IDictionaryRepository {
  Future<List<DictionaryEntries>> getAllEntries();
  Future<DictionaryEntries?> getEntryById(String id);
  Future<void> addEntry(DictionaryEntries entry);
  Future<void> updateEntry(DictionaryEntries entry);
  Future<void> deleteEntry(String id);
}

class DictionaryRepository implements IDictionaryRepository {
  Ref ref;

  DictionaryRepository(this.ref)
      : dictionaryLocalSource = ref.watch(dictionaryLocalSourcesProvider),
        dictionaryRemoteSource = ref.watch(dictionaryRemoteSourcesProvider);

  IDictionaryRemoteSources dictionaryRemoteSource;
  IDictionaryLocalSources dictionaryLocalSource;

  @override
  Future<void> addEntry(DictionaryEntries entry) async {
    await dictionaryRemoteSource.addEntry(entry);
  }

  @override
  Future<void> deleteEntry(String id) async {
    await dictionaryRemoteSource.deleteEntry(id);
  }

  @override
  Future<List<DictionaryEntries>> getAllEntries() async {
    return await dictionaryRemoteSource.getAllEntries();
  }

  @override
  Future<DictionaryEntries?> getEntryById(String id) async {
    return await dictionaryRemoteSource.getEntryById(id);
  }

  @override
  Future<void> updateEntry(DictionaryEntries entry) async {
    await dictionaryRemoteSource.updateEntry(entry);
  }
}
