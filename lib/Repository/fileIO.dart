import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:group_project/Model/recipe.dart';
import 'package:group_project/Model/ingredient.dart';


import '../Model/ingredient_list.dart';

class FileIO {
  // 파일 이름 상수
  static const String _starredRecipesFileName = 'starred_recipes.json';
  static const String _usedIngredientsFileName = 'used_ingredients.json';

  // 파일 경로 가져오기
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 파일 가져오기
  Future<File> _getFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  // StarredRecipe 저장
  Future<void> saveStarredRecipes(List<Recipe> starredRecipes) async {
    final file = await _getFile(_starredRecipesFileName);
    final data = starredRecipes.map((recipe) => recipe.toJson()).toList();
    await file.writeAsString(jsonEncode(data));
  }

  // StarredRecipe 불러오기
  Future<List<Recipe>> loadStarredRecipes() async {
    try {
      final file = await _getFile(_starredRecipesFileName);
      if (!await file.exists()) {
        return [];
      }
      
      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);
      return jsonData.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      print('Error loading starred recipes: $e');
      return [];
    }
  }

  // UsedIngredients 저장
  Future<void> saveUsedIngredients(LimitedQueue<Ingredient> ingredients) async {
    try {
      final file = await _getFile(_usedIngredientsFileName);
      // 현재 큐의 상태를 그대로 저장
      final data = ingredients.items.map((ingredient) => ingredient.toJson()).toList();
      await file.writeAsString(jsonEncode(data));
      
      print('Saved ingredients to file:');
      for (var ingredient in ingredients.items) {
        print(ingredient.name);
      }
    } catch (e) {
      print('Error saving used ingredients: $e');
    }
  }

  // UsedIngredients 불러오기
  Future<LimitedQueue<Ingredient>> loadUsedIngredients() async {
    try {
      final file = await _getFile(_usedIngredientsFileName);
      if (!await file.exists()) {
        return LimitedQueue<Ingredient>(10);
      }

      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);
      final limitedQueue = LimitedQueue<Ingredient>(10);
      final ingredients = jsonData.map((json) => Ingredient.fromJson(json)).toList();
      for (var ingredient in ingredients) {
        limitedQueue.add(ingredient);
      }
      return limitedQueue;
    } catch (e) {
      print('Error loading used ingredients: $e');
      return LimitedQueue<Ingredient>(10);
    }
  }
}
