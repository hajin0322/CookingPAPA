import 'package:group_project/model/ingredient.dart'; // Ingredient 모델 import
import 'package:group_project/model/recipe.dart'; // Recipe 모델 import

class DataSource {
  // Llama3 API 관련 정보
  final String llama3ApiKey;
  final String llama3ApiUrl;

  // Stable Diffusion API 관련 정보
  final String stableDiffusionApiKey;
  final String stableDiffusionApiUrl;

  // 사용된 재료 목록
  final Set<Ingredient> usedIngredientSet;

  // 선택된 재료 목록
  final Set<Ingredient> selectedIngredientSet;

  // 즐겨찾기 레시피 목록
  final List<Recipe> starredRecipeList;

  // 생성자
  DataSource({
    required this.llama3ApiKey,
    required this.llama3ApiUrl,
    required this.stableDiffusionApiKey,
    required this.stableDiffusionApiUrl,
    Set<Ingredient>? usedIngredients, // 선택적 매개변수로 사용된 재료 초기화
    Set<Ingredient>? selectedIngredients, // 선택적 매개변수로 선택된 재료 초기화
    List<Recipe>? starredRecipes, // 선택적 매개변수로 즐겨찾기 레시피 초기화
  })  : usedIngredientSet = usedIngredients ?? {}, // 기본값으로 빈 Set 사용
        selectedIngredientSet = selectedIngredients ?? {}, // 기본값으로 빈 Set 사용
        starredRecipeList = starredRecipes ?? []; // 기본값으로 빈 List 사용
}