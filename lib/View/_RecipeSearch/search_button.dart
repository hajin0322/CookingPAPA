import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'recipe_search_results.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final ingredientListViewModel =
        context.read<IngredientListViewModel>();
        final selectedIngredients =
            ingredientListViewModel.ingredientList.selectedIngredientList;

        if (selectedIngredients.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeSearchResults(
                result: selectedIngredients.map((e) => e.name).toList(),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select at least one ingredient'),
            ),
          );
        }
      },
      backgroundColor: AppStyles.bgColor,
      child: const Icon(Icons.search),
    );
  }
}