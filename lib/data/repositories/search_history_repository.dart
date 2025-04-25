import 'package:hive/hive.dart';
import 'package:store/data/models/search_history_model.dart';

class SearchHistoryRepository {
  static const String _boxName = "my_search_histories";
  Box<SearchHistoryModel>? _box;

  Future<Box<SearchHistoryModel>> get _getBox async {
    _box ??= await Hive.openBox<SearchHistoryModel>(_boxName);
    return _box!;
  }

  Future<List<SearchHistoryModel>> getSearchHistories() async {
    final box = await _getBox;
    return box.values.toList();
  }

  Future<void> saveSearchHistory({required SearchHistoryModel search}) async {
    final box = await _getBox;
    final exists = box.values.any((element) => element.title == search.title);
    if (!exists) {
      await box.add(search);
    }
  }

  Future<void> deleteSearchHistory({required SearchHistoryModel search}) async {
    final box = await _getBox;

    final keyToDelete = box.keys.firstWhere(
          (key) => box.get(key)?.title == search.title,
      orElse: () => null,
    );

    if (keyToDelete != null) {
      await box.delete(keyToDelete);
    }
  }

  Future<void> deleteAllSearchHistory() async {
    final box = await _getBox;
    await box.clear();
  }

  Future<void> updateSearchHistory({required SearchHistoryModel search}) async {
    final box = await _getBox;

    final keyToUpdate = box.keys.firstWhere(
          (key) => box.get(key)?.title == search.title,
      orElse: () => null,
    );

    if (keyToUpdate != null) {
      await box.put(keyToUpdate, search);
    }
  }
}
