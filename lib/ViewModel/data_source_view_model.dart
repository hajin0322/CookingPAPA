import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:group_project/Model/recipe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../DataSource/data_source_model.dart';
import '../Repository/fileIO.dart';
import '../ViewModel/ingredient_list_view_model.dart'; // IngredientListViewModel import 추가

class DataSourceViewModel with ChangeNotifier {
  final DataSource dataSource;
  final IngredientListViewModel
      ingredientListViewModel; //여기서 얘를 프로바이더로 생성된 ingredientListViewModel을 받을거임!!!!
  Recipe? recommendedRecipe;

  DataSourceViewModel(this.dataSource, this.ingredientListViewModel);

  Future<String> generateAIResponse(String content) async {
    final llamaApiKey = dataSource.llama3ApiKey;
    final url = dataSource.llama3ApiUrl;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $llamaApiKey',
    };
    final body = jsonEncode({
      'model': 'llama3-8b-8192',
      'messages': [
        {'role': 'user', 'content': content}
      ],
      'max_tokens': 80,
    });

    try {
      // HTTP POST 요청
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // 성공적으로 응답을 받았을 경우
        final responseData = jsonDecode(response.body); // JSON 파싱
        final content =
            responseData['choices'][0]['message']['content'] as String;

        // 개행 문자 제거 및 단일 문자열로 정리
        final cleanedContent =
            content.replaceAll('\n\n', ' ').replaceAll('\n', ' ');

        const maxLength = 220;
        if (cleanedContent.length > maxLength) {
          return '${cleanedContent.substring(0, maxLength)}...';
        } else {
          return cleanedContent;
        }
      } else {
        // 실패한 경우 상태 코드와 함께 반환
        print("Failed API call. Status code: ${response.statusCode}");
        return "API Error: ${response.statusCode}";
      }
    } catch (e) {
      // 예외 처리
      print("Error during API call: $e");
      return "AI Error";
    }
  }

  Future<String> generateCookingIdeas(String ingredients) async {
    final llamaApiKey = dataSource.llama3ApiKey;
    final url = dataSource.llama3ApiUrl;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $llamaApiKey',
    };

    final body = jsonEncode({
      'model': 'llama3-8b-8192',
      'messages': [
        {
          'role': 'user',
          'content': """
Using the some of the ingredients in $ingredients, don't have to use all ingredients, create a dish. Include:
1. Dish Name: The name of the dish.
2. Description: A short description of the dish.
3. Ingredients: List all ingredients needed with quantities.
4. Instructions: Step-by-step cooking instructions.
5. Image Prompt: A creative description for generating an image of the dish.

Dish should be simple.

Respond **exactly** in the following format, including the labels and without any additional text:

Dish Name: <dish name>
Description: <brief description>
Ingredients:
<ingredient 1>/<ingredient 2>/...
...
Instructions:
<step 1>/<step 2>/...
...
Image Prompt: <image prompt>
"""
        }
      ],
      'max_tokens': 500,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final content =
            jsonDecode(responseBody)['choices'][0]['message']['content'];
        print("Raw AI Response:\n$content");

        return content;
      } else {
        print("API call failed : ${response.body}");
        return "AI Error";
      }
    } catch (e) {
      print("Error during API call : $e");
      return "AI Error";
    }
  }

  Map<String, dynamic> _parseAIResponse(String aiResponse) {
    final lines = aiResponse.split('\n');
    String dishName =
        'Dish name not provided. This is an error in the AI’s answer.';
    String description =
        'Description not provided. This is an error in the AI’s answer.';
    String imagePrompt =
        'Generate AI Error Image with check the Internet code.';
    List<String> ingredients = [];
    List<String> instructions = [];
    bool isIngredientsSection = false;
    bool isInstructionsSection = false;

    for (var line in lines) {
      if (line.startsWith('Dish Name:')) {
        dishName = line.replaceFirst('Dish Name:', '').trim();
        isIngredientsSection = false;
        isInstructionsSection = false;
      } else if (line.startsWith('Description:')) {
        description = line.replaceFirst('Description:', '').trim();
        isIngredientsSection = false;
        isInstructionsSection = false;
      } else if (line.startsWith('Ingredients:')) {
        isIngredientsSection = true;
        isInstructionsSection = false;
      } else if (line.startsWith('Instructions:')) {
        isIngredientsSection = false;
        isInstructionsSection = true;
      } else if (line.startsWith('Image Prompt:')) {
        imagePrompt = line.replaceFirst('Image Prompt:', '').trim();
        isIngredientsSection = false;
        isInstructionsSection = false;
      } else if (isIngredientsSection) {
        if (line.trim().isNotEmpty) {
          ingredients.add("${line.trim()}\\");
        }
      } else if (isInstructionsSection) {
        if (line.trim().isNotEmpty) {
          instructions.add("${line.trim()}\\");
        }
      }
    }

    if (ingredients.isEmpty) {
      ingredients.add(
          "No ingredients provided. Please refer to the general cooking guide. This is an error in the AI’s answer.");
    }

    if (instructions.isEmpty) {
      instructions.add(
          "No instructions provided. Please refer to the general cooking guide. This is an error in the AI’s answer.");
    }

    return {
      'dishName': dishName,
      'description': '$description\n$ingredients\n$instructions',
      'imagePrompt': imagePrompt,
    };
  }

  Future<Uint8List?> generateImage(String prompt) async {
    final apiKey = dataSource.huggingFaceApiKey;
    final url = dataSource.huggingFaceApiUrl;

    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({'inputs': prompt});

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Image generated successfully!');
        return response.bodyBytes; // Return image data
      } else {
        print('Failed response: ${response.body}');
        throw Exception('Failed to generate image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error generating image: $e');
      return null;
    }
  }

  Future<List<Recipe>> generateMultipleRecipes(
      String ingredients, int count) async {
    List<Recipe> recipes = [];

    try {
      for (int i = 0; i < count; i++) {
        try {
          // Generate cooking ideas
          final response = await generateCookingIdeas(ingredients);
          if (response == 'AI Error') throw Exception('Llama3 Network Error');
          final aiResult = _parseAIResponse(response);

          // Generate image
          final aiImage = await generateImage(aiResult['imagePrompt']);
          if (aiImage != null) {
            // Convert image to base64
            String base64Image = base64Encode(aiImage);

            Recipe result = Recipe(
              recipeTitle: aiResult['dishName'],
              recipeImage: base64Image, // base64-encoded image
              recipeContent: aiResult['description'],
            );
            recipes.add(result);
          } else {
            throw Exception('Stable Diffusion Network Error');
          }
        } catch (e) {
          // Handle errors specific to this recipe generation step
          print('Error during recipe generation for index $i: $e');
          rethrow; // Rethrow exception to propagate to higher-level handler
        }
      }
    } catch (e) {
      // Handle errors in the overall process
      print('Error during multiple recipe generation: $e');
      rethrow; // Rethrow exception to propagate to higher-level handler
    }

    notifyListeners();
    return recipes;
  }

  Future<Recipe?> generateRecipeFromUsedIngredients() async {
    try {
      // FileIO에서 사용된 재료들 불러오기
      final fileIO = FileIO();
      final usedIngredientsQueue = await fileIO.loadUsedIngredients();

      if (usedIngredientsQueue.length == 0) {
        print('No used ingredients found');
        return null;
      }

      // 사용된 재료들의 이름을 문자열로 변환
      final usedIngredients = usedIngredientsQueue.items
          .map((ingredient) => ingredient.name)
          .join(', ');

      print('Generating recipe from used ingredients: $usedIngredients');

      // 기존 함수 재사용
      final recipes = await generateMultipleRecipes(usedIngredients, 1);
      if (recipes.isNotEmpty) {
        recommendedRecipe = recipes.first;
        notifyListeners();
        return recommendedRecipe;
      }
    } catch (e) {
      // FileIO 관련 예외 처리
      print('Error loading used ingredients: $e');
      rethrow;
    }
    return null;
  }
}
