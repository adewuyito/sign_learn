import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';

import '../../business/repository/dictionary_repository.dart';

class FirebaseDictionaryRepository implements DictionaryRepository {
  final FirebaseFirestore firestore;
  FirebaseDictionaryRepository(this.firestore);

  @override
  Future<List<DictionaryEntries>> getAllEntries() async {
    final query = await firestore.collection('dictionary_entries').get();
    return query.docs
        .map((doc) => DictionaryEntries.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<DictionaryEntries?> getEntryById(String id) async {
    final doc = await firestore.collection('dictionary_entries').doc(id).get();
    if (doc.exists) {
      return DictionaryEntries.fromJson({...doc.data()!, 'id': doc.id});
    }
    return null;
  }

  @override
  Future<void> addEntry(DictionaryEntries entry) async {
    await firestore.collection('dictionary_entries').add(entry.toJson());
  }

  @override
  Future<void> updateEntry(DictionaryEntries entry) async {
    await firestore
        .collection('dictionary_entries')
        .doc(entry.id)
        .update(entry.toJson());
  }

  @override
  Future<void> deleteEntry(String id) async {
    await firestore.collection('dictionary_entries').doc(id).delete();
  }
}
