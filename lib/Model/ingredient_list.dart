import 'dart:collection';
import 'package:group_project/Repository/ingredient_list_repository.dart';
import 'package:group_project/Model/ingredient.dart';

class IngredientList {
  final IngredientRepository _repository = IngredientRepository();

  // 전체 재료 목록
  List<Ingredient> get ingredientList => _repository.getAllIngredients();

  // 사용된 재료 목록
  LimitedQueue<Ingredient> usedIngredientQueue = LimitedQueue<Ingredient>(10);

  // 선택된 재료 목록
  List<Ingredient> selectedIngredientList = [];

  // 모든 카테고리 가져오기
  List<String> get categories {
    return ingredientList.map((ingredient) => ingredient.category).toSet().toList();
  }
}

class LimitedQueue<Ingredient> {
  final int maxLength;
  final Queue<Ingredient> _queue = Queue<Ingredient>();
  final Set<Ingredient> _set = <Ingredient>{};

  LimitedQueue(this.maxLength);

  void add(Ingredient value) {
    if (_set.contains(value)) {
      _queue.removeWhere((element) => element == value);
      _set.remove(value);
    }
    
    if (_queue.length >= maxLength) {
      Ingredient removed = _queue.removeFirst();
      _set.remove(removed);
    }
    
    _queue.addLast(value);
    _set.add(value);
  }

  Ingredient? remove() {
    if (_queue.isEmpty) return null;
    Ingredient value = _queue.removeFirst();
    _set.remove(value);
    return value;
  }

  List<Ingredient> get items => _queue.toList();

  int get length => _queue.length;

  bool contains(Ingredient value) => _set.contains(value);

  void clear() {
    _queue.clear();
    _set.clear();
  }
}