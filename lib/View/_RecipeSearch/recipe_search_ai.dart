import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RecipeSearchAI {
  Future<List<Map<String, String>>> generateCookingIdeas(String ingredients) async {
    final llamaApiKey = dotenv.env['llama3ApiKey'];
    final url = 'https://api.groq.com/openai/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $llamaApiKey',
    };

    List<Map<String, String>> recipes = [];

    for (int i = 0; i < 3; i++) {
      final body = jsonEncode({
        'model': 'llama3-8b-8192',
        'messages': [
          {
            'role': 'user',
            'content':
            "Create a dish using some of '$ingredients'. Provide the name of the dish, a brief description of the dish, the full recipe, and an image generation prompt. Please provide the response exactly in the following format without any additional text or explanations:\n\nDish Name: <dish name>\nDescription: <brief description>\nRecipe: <recipe>\nImage Prompt: <image prompt>"
          }
        ],
        'max_tokens': 500,
      });

      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final aiResponse = jsonResponse['choices'][0]['message']['content'];
        print('AI Response:\n$aiResponse');

        final dishNameMatch = RegExp(r'Dish Name:\s*(.*)').firstMatch(aiResponse);
        final descriptionMatch = RegExp(r'Description:\s*(.*)').firstMatch(aiResponse);
        final recipeMatch = RegExp(r'Recipe:\s*((?:.|\n)*?)\nImage Prompt:', multiLine: true)
            .firstMatch(aiResponse);
        final imagePromptMatch =
        RegExp(r'Image Prompt:\s*(.*)', multiLine: true).firstMatch(aiResponse);

        final dishName =
        dishNameMatch != null ? dishNameMatch.group(1)!.trim() : 'Dish name not provided';
        final description =
        descriptionMatch != null ? descriptionMatch.group(1)!.trim() : 'Description not provided';
        final recipe =
        recipeMatch != null ? recipeMatch.group(1)!.trim() : 'Recipe not provided';
        final imagePrompt =
        imagePromptMatch != null ? imagePromptMatch.group(1)!.trim() : 'Prompt not provided';

        recipes.add({
          'dishName': dishName,
          'description': description,
          'recipe': recipe,
          'imagePrompt': imagePrompt,
        });
      } else {
        throw Exception('Failed to generate cooking idea: ${response.reasonPhrase}');
      }
    }

    return recipes;
  }
}
