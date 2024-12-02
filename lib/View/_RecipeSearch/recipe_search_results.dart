import 'package:flutter/material.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import '../../Model/recipe.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';

class RecipeSearchResults extends StatelessWidget {
  final List<Recipe> results;

  const RecipeSearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search Results", showBackButton: true),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          if (results.isEmpty) {
            return Center(
              child: Text(
                "PAPA is too tired!\nPlease try again in a minute!",
                style:
                    AppStyles.headLineStyle2.copyWith(color: AppStyles.textColor),
              ),
            );
          }
          final recipe = results[index];
          return RecipeSection(
            recipe: recipe,
          );
        },
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
