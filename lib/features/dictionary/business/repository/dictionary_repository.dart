import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';

abstract class DictionaryRepository {
  Future<List<DictionaryEntries>> getAllEntries();
  Future<DictionaryEntries?> getEntryById(String id);
  Future<void> addEntry(DictionaryEntries entry);
  Future<void> updateEntry(DictionaryEntries entry);
  Future<void> deleteEntry(String id);
}
