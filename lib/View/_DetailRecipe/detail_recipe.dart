import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/recipe.dart';
import '../../ViewModel/recipe_view_model.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;

  const DetailRecipe({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeListViewModel = context.watch<RecipeListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.recipeTitle),
        actions: [
          GestureDetector(
            onTap: () {
              recipeListViewModel.changeStarred(recipe); // 상태 변경
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                recipe.isStarred ? Icons.star : Icons.star_border,
                color: recipe.isStarred ? Colors.yellow : Colors.grey, // 색상 변경
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: recipe.recipeImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 16.0),
            Text(
              recipe.recipeContent,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
