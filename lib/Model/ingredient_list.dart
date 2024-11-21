import 'package:group_project/Repository/ingredient_list_repository.dart';
import 'package:group_project/Model/ingredient.dart';

class IngredientList {
  //repository에서 모든 리스트 받아와서 저장하기
  final List<Ingredient> ingredientList = IngredientRepository().getAllIngredients(); //전체 재료 목록
  Set<Ingredient> usedIngredientList = {}; // 사용된 재료 목록
  Set<Ingredient> selectedIngredientList = {}; // 선택된 재료 목록 => api call할때 넘겨줄 자료
}