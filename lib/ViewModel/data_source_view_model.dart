import 'package:flutter/material.dart';
import 'package:group_project/model/ingredient.dart'; // Ingredient 모델 import
import 'package:group_project/model/recipe.dart'; // Recipe 모델 import
import 'package:http/http.dart' as http; // HTTP 요청을 위한 패키지
import 'dart:convert';
import '../DataSource/data_source_model.dart'; // JSON 변환을 위한 패키지
/*
class DataSourceViewModel extends ChangeNotifier {
  final DataSource dataSource; // DataSource를 주입받음
  List<Recipe> resultRecipeList = []; // 결과 레시피 목록

  DataSourceViewModel(this.dataSource);

  // API 호출하여 레시피 제목 가져오기
  Future<void> fetchRecipes(List<Ingredient> ingredients) async {
    try {
      // 예시 API URL (실제 API URL로 변경해야 함)
      final response = await http.get(Uri.parse(dataSource.llama3ApiUrl));

      if (response.statusCode == 200) {
        // JSON 응답 파싱
        List<dynamic> jsonResponse = json.decode(response.body);

        for (var item in jsonResponse) {
          String recipeTitle = item['title']; // 레시피 제목 추출
          String imageUrl = await fetchImageForRecipe(recipeTitle); // 이미지 생성 요청

          // Recipe 객체 생성
          Recipe recipe = Recipe(
            recipeTitle: recipeTitle,
            recipeImage: Image.network(imageUrl), // 이미지 URL로부터 Image 객체 생성
            recipeContent: item['content'] ?? '내용 없음', // 내용이 없을 경우 기본값 설정
          );

          resultRecipeList.add(recipe); // 결과 레시피 목록에 추가
        }

        notifyListeners(); // UI에 상태 변화 알림
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  }

  // 레시피 제목으로 이미지 생성 요청 (예시)
  Future<String> fetchImageForRecipe(String recipeTitle) async {
    // 예시 API URL (실제 이미지 생성 API URL로 변경해야 함)
    final response = await http.get(Uri.parse('https://api.example.com/generate-image?title=$recipeTitle'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['imageUrl']; // 이미지 URL 반환
    } else {
      throw Exception('Failed to generate image');
    }
  }
}*/