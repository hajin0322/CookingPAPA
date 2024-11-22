import 'package:flutter/material.dart';
import 'package:group_project/model/recipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DataSource/data_source_model.dart';
import '../ViewModel/ingredient_list_view_model.dart'; // IngredientListViewModel import 추가

class DataSourceViewModel with ChangeNotifier {
  final DataSource dataSource;
  final IngredientListViewModel ingredientListViewModel; //여기서 얘를 프로바이더로 생성된 ingredientListViewModel을 받을거임!!!!
  List<Recipe> resultRecipeList = [];

  DataSourceViewModel(this.dataSource, this.ingredientListViewModel);

/*  // API 호출하여 레시피 제목 가져오기
  Future<void> fetchRecipes() async {
    try {
      // IngredientListViewModel에서 선택된 재료 목록 가져오기
      List<Ingredient> selectedIngredients = ingredientListViewModel.selectedIngredientList.toList();

      // API 요청 본문 생성
      String requestBody = json.encode({
        'ingredients': selectedIngredients.map((i) => i.name).toList(),
      });

      // API 호출
      final response = await http.post(
        Uri.parse(dataSource.llama3ApiUrl),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        resultRecipeList.clear(); // 기존 결과 초기화

        for (var item in jsonResponse) {
          String recipeTitle = item['title'];
          String imageUrl = await fetchImageForRecipe(recipeTitle);

          Recipe recipe = Recipe(
            recipeTitle: recipeTitle,
            recipeImage: Image.network(imageUrl),
            recipeContent: item['content'] ?? '내용 없음',
          );

          resultRecipeList.add(recipe);
        }

        // 사용된 재료 목록 업데이트
        ingredientListViewModel.addUsedIngredients(selectedIngredients);

        notifyListeners();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  } */

  Future<String> fetchImageForRecipe(String recipeTitle) async {
    final response = await http.post(
      Uri.parse(dataSource.stableDiffusionApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'prompt': 'A dish of $recipeTitle'}),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['imageUrl'];
    } else {
      throw Exception('Failed to generate image');
    }
  }
}