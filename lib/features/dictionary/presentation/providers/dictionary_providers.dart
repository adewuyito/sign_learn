import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';
import '../../business/repository/dictionary_repository.dart';
import '../../business/usecases/get_dictionary_entries.dart';
import '../../data/repository/firebase_dictionary_repository.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final dictionaryRepositoryProvider = Provider<DictionaryRepository>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return FirebaseDictionaryRepository(firestore);
  },
);

final getDictionaryEntriesProvider = Provider(
  (ref) => GetDictionaryEntries(
    ref.watch(dictionaryRepositoryProvider),
  ),
);

final dictionaryEntriesProvider = FutureProvider<List<DictionaryEntries>>(
  (ref) async {
    final getEntries = ref.watch(getDictionaryEntriesProvider);
    return getEntries();
  },
);
