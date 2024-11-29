import 'package:flutter/cupertino.dart';
import 'package:group_project/Model/ingredient_list.dart';
import 'package:group_project/Repository/fileIO.dart';
import '../Model/ingredient.dart';

class IngredientListViewModel with ChangeNotifier {
  final fileIO = FileIO();
  final IngredientList ingredientList;

  // 생성자에서 초기화 제거
  IngredientListViewModel(this.ingredientList);

  // 파일에서 사용된 재료를 로드하여 큐 초기화
  Future<void> initializeUsedIngredients() async {
    final loadedQueue = await fileIO.loadUsedIngredients();
    ingredientList.usedIngredientQueue = loadedQueue;
    notifyListeners();
  }

  // 사용된 재료 추가
  void addUsedIngredient(List<Ingredient> selectedIngredient) async {
    
    // 기존 큐에 새로운 재료들 추가
    for (int i = 0; i < selectedIngredient.length; i++) {
      ingredientList.usedIngredientQueue.add(selectedIngredient[i]);
    }

    // 현재 큐의 내용 출력 (디버깅용)
    print("\nUpdated Queue contents:");
    for (var ingredient in ingredientList.usedIngredientQueue.items) {
      print(ingredient.name);
    }

    // 업데이트된 큐를 파일에 저장
    await fileIO.saveUsedIngredients(ingredientList.usedIngredientQueue);

    notifyListeners();
  }

  // 선택된 재료를 리스트에 추가
  // 이 정도는 그때그때 바꾸면 되니까 notifyListeners 까지는 필요 없을것 같다.
  bool addToSelectedList(Ingredient ingredient) {
    const int maxSelection = 5; // 선택 제한 예시
    if (ingredientList.selectedIngredientList.length >= maxSelection) {
      // 스낵바 메시지 표시: "더 이상 재료를 선택할 수 없습니다."
      return false;
    } else {
      ingredient.isSelected = true;
      ingredientList.selectedIngredientList.add(ingredient);
      return true;
    }
  }

  // 선택바꾸기 => 이에 대한 Return값은 true false로 나오니 나중에 view에서 유용하게 쓰일것임.
  // 아이콘버튼 Onpressed하면 => selectionChange(ingredient)실행 => true 값 반환시 isSelected 유무 판별해서 아이콘버튼 체인지, false반환시 snackbar 출력
  // 삼항연산자 안에 또 삼항연산자 가능한가?
  // onPressed() : {selectionChange(ingredient)?? (ingredient.isSelected?? icon.checkedbox : icon.notcheckedbox) : snackbar 표시}
  bool selectionChange(Ingredient ingredient) {
    if (ingredient.isSelected) {
      ingredient.isSelected = false;
      ingredientList.selectedIngredientList
          .removeWhere((item) => item.name == ingredient.name);
      notifyListeners(); // 추가
      return true;
    } else {
      final success = addToSelectedList(ingredient);
      if (success) {
        notifyListeners(); // 추가
      }
      return success;
    }
  }

  // 선택된 리스트 초기화
  // 재료 선택 화면에서 유용하게 쓰일것 (물론 또 버튼 누르면 바뀌는식으로 해야겠지만)
  void resetSelectedList() {
    for (Ingredient ingredient in ingredientList.selectedIngredientList) {
      ingredient.isSelected = false; //각 ingredient bool값 변경
    }
    ingredientList.selectedIngredientList.clear(); // 세트 초기화
    notifyListeners(); // view쪽에서 백엔드에서 clear 시켰으니 그걸 알아야 하므로,,. notifyListeners.
  }

  // 썻었던 ingredient 기록 초기화
  Future<void> resetUsedList() async {
    ingredientList.usedIngredientQueue.clear();
    await fileIO.saveUsedIngredients(ingredientList.usedIngredientQueue);

  }

  // 카테고리 가져오기
  List<String> get categories => ingredientList.categories;
  LimitedQueue<Ingredient> get usedIngredientQueue => ingredientList.usedIngredientQueue;
// 카테고리별 재료 가져오기
  List<Ingredient> getIngredientsByCategory(String category) {
    return ingredientList.ingredientList
        .where((ingredient) => ingredient.category == category)
        .toList();
  }

}
