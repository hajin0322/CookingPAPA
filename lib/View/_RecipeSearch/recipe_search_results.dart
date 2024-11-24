import 'package:flutter/material.dart';
import '../../Model/recipe.dart';
import '../_DetailRecipe/detail_recipe.dart';
import '../_DetailRecipe/recipe_section.dart';

class RecipeSearchResults extends StatelessWidget {
  final List<Recipe> results;

  const RecipeSearchResults({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final recipe = results[index];
          return RecipeSection(
            recipe: recipe,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRecipe(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
