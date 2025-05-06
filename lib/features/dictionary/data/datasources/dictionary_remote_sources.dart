import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final dictionaryRemoteSourcesProvider = Provider<IDictionaryRemoteSources>(
  (ref) {
    final firestore = ref.watch(firestoreProvider);
    return DictionaryRemoteSources(ref, firestore: firestore);
  },
);

abstract class IDictionaryRemoteSources {
  Future<List<DictionaryEntries>> getAllEntries();
  Future<DictionaryEntries?> getEntryById(String id);
  Future<void> deleteEntry(String id);
}

class DictionaryRemoteSources implements IDictionaryRemoteSources {
  static const String collectionsName = "dictionary";
  final FirebaseFirestore firestore;
  Ref ref;
  DictionaryRemoteSources(this.ref, {required this.firestore});

  @override
  Future<List<DictionaryEntries>> getAllEntries() async {
    try {
      final query = await firestore
          .collection(collectionsName)
          .orderBy('title', descending: false)
          .get();
      if (query.docs.isEmpty) {
        debugPrint('No dictionary entries found');
        throw Exception('No dictionary entries found');
      }

      return query.docs
          .map(
            (doc) => DictionaryEntries.fromFirebase(
              doc.data(),
              id: doc.id,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch dictionary entries: $e');
    }
  }

  @override
  Future<DictionaryEntries?> getEntryById(String id) async {
    try {
      final doc = await firestore.collection(collectionsName).doc(id).get();
      if (doc.exists) {
        return DictionaryEntries.fromFirebase(
          doc.data()!,
          id: doc.id,
        );
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get entry by id: $e');
    }
  }

  @override
  Future<void> deleteEntry(String id) async {
    await firestore.collection(collectionsName).doc(id).delete();
  }
}
