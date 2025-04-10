import 'package:sign_learn/features/dictionary/business/repository/dictionary_repository.dart';
import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';

class GetDictionaryEntries {
  final DictionaryRepository repository;
  GetDictionaryEntries(this.repository);

  Future<List<DictionaryEntries>> call() async {
    return repository.getAllEntries();
  }
}
