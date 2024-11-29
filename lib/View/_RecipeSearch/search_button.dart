import 'package:flutter/material.dart';
import 'package:group_project/ViewModel/data_source_view_model.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'recipe_search_results.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSourceViewModel = Provider.of<DataSourceViewModel>(context, listen: false);
    return FloatingActionButton.extended(
      onPressed: () async {
        final ingredientViewModel = context.read<IngredientListViewModel>();
        
        // 검색 시작 전에 사용된 재료 목록 초기화
        await ingredientViewModel.initializeUsedIngredients();
        
        final selectedIngredients =
            ingredientViewModel.ingredientList.selectedIngredientList;
        print(selectedIngredients);

        if (selectedIngredients.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one ingredient')),
          );
          return;
        }
        ingredientViewModel.addUsedIngredient(selectedIngredients);

        try {
          final combinedIngredients =
              selectedIngredients.map((e) => e.name).join(', ');

          // Generate recipes using AI
          final recipes = await dataSourceViewModel.generateMultipleRecipes(combinedIngredients, 3);

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
