import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';
import 'package:sign_learn/features/dictionary/data/repository/dictionary_repository.dart';

class GetDictionaryEntriesById {
  final IDictionaryRepository repository;
  final String id;
  GetDictionaryEntriesById(this.repository, {required this.id});

  Future<DictionaryEntries?> call() async {
    return await repository.getEntryById(id);
  }
}
