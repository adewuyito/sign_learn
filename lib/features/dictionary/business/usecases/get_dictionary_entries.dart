import 'package:sign_learn/features/dictionary/data/models/dictionary_models.dart';
import 'package:sign_learn/features/dictionary/data/repository/dictionary_repository.dart';

class GetDictionaryEntries {
  final IDictionaryRepository repository;
  GetDictionaryEntries(this.repository);

  Future<List<DictionaryEntries>> call() async {
    return await repository.getAllEntries();
  }
}
