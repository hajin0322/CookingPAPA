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
<ingredient 1>
<ingredient 2>
...
Instructions:
<step 1>
<step 2>
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
          ingredients.add(line.trim());
        }
      } else if (isInstructionsSection) {
        if (line.trim().isNotEmpty) {
          instructions.add(line.trim());
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
      'description': description + '\n' + ingredients.toString() + '\n' + instructions.toString(),
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

  Future<List<Recipe>> generateMultipleRecipes(String ingredients, int count) async {
    List<Recipe> recipes = [];
    for (int i = 0; i < count; i++) {
      final response = await generateCookingIdeas(ingredients);
      final aiResult = _parseAIResponse(response);
      final aiImage = await generateImage(aiResult['imagePrompt']);
      
      if (aiImage != null) {
        // Uint8List 이미지만 base64로 인코딩
        String base64Image = base64Encode(aiImage);
        
        Recipe result = Recipe(
          recipeTitle: aiResult['dishName'],
          recipeImage: base64Image,  // base64로 인코딩된 이미지
          recipeContent: aiResult['description']
        );
        recipes.add(result);
      } else {
        print('Failed to generate image for recipe ${aiResult['dishName']}');
        // 이미지 생성 실패 시 처리
      }
    }
    notifyListeners();
    return recipes;
  }

  Future<Recipe?> generateRecipeFromUsedIngredients() async {
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
    return null;
  }
}
