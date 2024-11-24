import 'package:flutter/material.dart';
import '../Model/recipe.dart';

class RecipeListViewModel with ChangeNotifier {
  List<Recipe> starredList = []; // 즐겨찾기 목록

  void changeStarred(Recipe recipe) {
    if (recipe.isStarred) {
      recipe.isStarred = false;
      starredList.removeWhere((item) => item.recipeTitle == recipe.recipeTitle);
    } else {
      recipe.isStarred = true;
      starredList.add(recipe);
    }
    notifyListeners(); // 상태 변경 알림
  }

  List<Recipe> getStarredRecipes() {
    return List.from(starredList); // 즐겨찾기 목록 반환
  }
}
