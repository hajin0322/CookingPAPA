import 'package:group_project/Repository/ingredient_list_repository.dart';
import 'package:group_project/Model/ingredient.dart';

class IngredientList {
  final IngredientRepository _repository = IngredientRepository();

  // 전체 재료 목록
  List<Ingredient> get ingredientList => _repository.getAllIngredients();

  // 사용된 재료 목록
  Set<Ingredient> usedIngredientList = {};

  // 선택된 재료 목록
  Set<Ingredient> selectedIngredientList = {};

  // 모든 카테고리 가져오기
  List<String> get categories {
    return ingredientList.map((ingredient) => ingredient.category).toSet().toList();
  }

}
