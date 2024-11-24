import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'recipe_search_results.dart';
import 'recipe_search_ai.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        final ingredientViewModel = context.read<IngredientListViewModel>();
        final selectedIngredients =
            ingredientViewModel.ingredientList.selectedIngredientList;

        if (selectedIngredients.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one ingredient')),
          );
          return;
        }

        try {
          final recipeAI = RecipeSearchAI();
          final combinedIngredients =
          selectedIngredients.map((e) => e.name).join(', ');

          // Generate recipes using AI
          final recipes = await recipeAI.generateCookingIdeas(combinedIngredients);

          // Navigate to results screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeSearchResults(results: recipes),
            ),
          );
        } catch (e) {
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
