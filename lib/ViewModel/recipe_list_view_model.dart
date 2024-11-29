import 'package:flutter/material.dart';
import 'package:group_project/Repository/fileIO.dart';
import '../Model/recipe.dart';

class RecipeListViewModel with ChangeNotifier {
  
  List<Recipe> starredList = []; // 즐겨찾기 목록 빈 리스트로 초기화
  
  RecipeListViewModel(List<Recipe> initialStarred) {
    starredList = initialStarred;
  }

  void changeStarred(Recipe recipe) {
    if (recipe.isStarred) {
      recipe.isStarred = false;
      starredList.removeWhere((item) => item.recipeTitle == recipe.recipeTitle);
    } else {
      recipe.isStarred = true;
      starredList.add(recipe);

    }
    notifyListeners(); // 상태 변경 알림
    // 파일에서 찾아서 없앨 필요 조차 없음. starredList를 받아서 "덮어쓰면 되는거니까"
    // 항상 파일 자체는 덮어쓴다는 개념이 중요한것임!!!
    FileIO().saveStarredRecipes(starredList);
  }

  List<Recipe> getStarredRecipes() {
    return List.from(starredList); // 즐겨찾기 목록 반환 => myfridge에서 사용
  }

  // 새로운 getter 메서드 그냥 하나의 정보 덩어리를 받아와서 가져다가 쓰는거임.
  // Snapshot method for static properties
  Map<String, dynamic> getRecipeSnapshot(Recipe recipe) {
    return {
      'title': recipe.recipeTitle,
      'content': recipe.recipeContent,
    };
  }

  bool getIsStarred(Recipe recipe) {
    return recipe.isStarred;
  }
}
