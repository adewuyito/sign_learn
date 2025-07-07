import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/dictionary/business/usecases/get_entry_by_id.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';
import '../../business/usecases/get_dictionary_entries.dart';
import '../../data/repository/dictionary_repository.dart';

final dictionaryEntriesProvider = FutureProvider<List<DictionaryEntries>>(
  (ref) async {
    return await GetDictionaryEntries(ref.watch(dictionaryRepositoryProvider))
        .call();
  },
);

final dictionaryEntryByIdProvider =
    FutureProvider.family<DictionaryEntries?, String>((
  ref,
  id,
) async {
  final dictionaryEntry = GetDictionaryEntriesById(
    ref.watch(dictionaryRepositoryProvider),
    id: id,
  );
  return await dictionaryEntry();
});
