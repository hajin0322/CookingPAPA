import '../model/recipe.dart';

// 레시피 리스트 뷰모델
class RecipeListViewModel {
  List<Recipe> starredList = []; // 즐겨찾기 목록

  // 즐겨찾기 추가 또는 해제 이것도 그때그때 하면 돼서 changeNotifier 필요 없을듯
  void changeStarred(Recipe recipe) {
    if (recipe.isStarred) {
      // 현재 즐겨찾기에 있는 경우 => 해제
      recipe.isStarred = false;
      starredList.removeWhere((item) => item.recipeTitle == recipe.recipeTitle);
    } else {
      // 현재 즐겨찾기에 없는 경우 => 추가
      recipe.isStarred = true;
      starredList.add(recipe);
    }
  }

  // 모든 즐겨찾기 초기화
  void reset() {
    for (Recipe recipe in starredList) {
      changeStarred(recipe);
    }
  }

  // 특정 레시피 가져오기 (예시)
  Recipe getRecipe(Recipe recipe) {
    return recipe;
  }

  // 즐겨찾기 목록 가져오기
  List<Recipe> getStarredRecipes() {
    return List.from(starredList); // 현재 즐겨찾기 목록 반환
  }
}