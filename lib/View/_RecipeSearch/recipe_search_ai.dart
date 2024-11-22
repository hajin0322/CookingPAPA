import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'recipe_search_results.dart';
import 'recipe_search_ai.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final ingredientListViewModel = context.read<IngredientListViewModel>();
        final selectedIngredients =
            ingredientListViewModel.ingredientList.selectedIngredientList;

        if (selectedIngredients.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one ingredient')),
          );
          return;
        }

        try {
          final recipeAI = RecipeSearchAI();
          final combinedIngredients = selectedIngredients.map((e) => e.name).join(', ');

          // AI에서 요리 생성
          final recipes = await recipeAI.generateCookingIdeas(combinedIngredients);

          // 결과 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeSearchResults(results: recipes),
            ),
          );
        } catch (e) {
          print("Error during AI API call: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to generate recipes: $e')),
          );
        }
      },
      backgroundColor: AppStyles.bgColor,
      label: Text("Start Cooking", style: AppStyles.headLineStyle3),
      icon: const Icon(Icons.search),
    );
  }
}
