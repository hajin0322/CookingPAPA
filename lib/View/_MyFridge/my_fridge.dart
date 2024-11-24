import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/recipe_view_model.dart';
import '../_DetailRecipe/detail_recipe.dart';
import '../_DetailRecipe/recipe_section.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final starredRecipes = context.watch<RecipeListViewModel>().getStarredRecipes();

    return Scaffold(
      appBar: AppBar(title: const Text("My Fridge")),
      body: ListView.builder(
        itemCount: starredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = starredRecipes[index];
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
