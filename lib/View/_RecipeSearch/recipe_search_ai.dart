import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_project/View/_RecipeSearch/recipe_image_generater.dart';
import 'package:http/http.dart' as http;
import 'package:group_project/Model/recipe.dart'; // Recipe 모델

class RecipeSearchAI {
  Future<List<Recipe>> generateCookingIdeas(String ingredients) async {
    final llamaApiKey = dotenv.env['llama3ApiKey'];
    const url = 'https://api.groq.com/openai/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $llamaApiKey',
    };

    final imageGenerator = ImageGenerator();
    List<Recipe> recipes = [];

    for (int i = 0; i < 3; i++) {
      final body = jsonEncode({
        'model': 'llama3-8b-8192',
        'messages': [
          {
            'role': 'user',
            'content': """
Using the ingredients: $ingredients, create a dish. Include:
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

          final recipeData = _parseAIResponse(content);

          // 이미지 생성
          final imagePrompt = recipeData['imagePrompt'] ?? '';
          final imageData = await imageGenerator.generateImage(imagePrompt);

          // `MemoryImage`로 변환
          ImageProvider recipeImage = imageData != null
              ? MemoryImage(imageData)
              : const AssetImage('assets/images/placeholder.png');

          // Recipe 객체 생성
          final recipe = Recipe(
            recipeTitle: recipeData['dishName'] ?? 'No title',
            recipeImage: recipeImage,
            recipeContent: """
${recipeData['description'] ?? 'No description available'}

Ingredients:
${recipeData['ingredients'].join('\n')}

Instructions:
${recipeData['instructions'].join('\n')}
""", // 전체 내용을 하나의 필드에 저장
          );

          recipes.add(recipe);
        } else {
          print("API call failed (Attempt $i): ${response.body}");
        }
      } catch (e) {
        print("Error during API call (Attempt $i): $e");
      }
    }

    return recipes;
  }

  Map<String, dynamic> _parseAIResponse(String aiResponse) {
    final lines = aiResponse.split('\n');
    String dishName = 'Dish name not provided. This is an error in the AI’s answer.';
    String description = 'Description not provided. This is an error in the AI’s answer.';
    String imagePrompt = 'Prompt not provided. This is an error in the AI’s answer.';
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

    if(ingredients.isEmpty){
      ingredients.add("No ingredients provided. Please refer to the general cooking guide. This is an error in the AI’s answer.");
    }

    if (instructions.isEmpty) {
      instructions.add("No instructions provided. Please refer to the general cooking guide. This is an error in the AI’s answer.");
    }

    return {
      'dishName': dishName,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
      'imagePrompt': imagePrompt,
    };
  }
}
