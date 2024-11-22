import 'package:flutter/material.dart';
import 'package:group_project/View/_DetailRecipe/recipe_section.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/detail_recipe.dart';

class RecipeSearchResults extends StatelessWidget {
  final List<Map<String, String>> results;

  const RecipeSearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Search Results", showBackButton: true),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final recipe = results[index];
          final dishName = recipe['dishName'] ?? 'Unknown Dish';
          final description = recipe['description'] ?? 'No description available';
          final fullRecipe = recipe['recipe'] ?? 'No recipe provided';
          final imagePrompt = recipe['imagePrompt'] ?? 'No image prompt available';

          return RecipeSection(
            title: dishName, // 요리 이름
            imagePath: index == 0
                ? AppMedia.recipe1
                : (index == 1 ? AppMedia.recipe2 : AppMedia.recipe1),
            onTap: () {
              // 클릭 시 DetailRecipe로 데이터 전달
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailRecipe(
                    dishName: dishName,
                    recipe: fullRecipe,
                    imagePrompt: imagePrompt,
                  ),
                ),
              );
            },
            additionalInfo: description, // 간단한 요리 설명
            ico: AppMedia.iconList[index % AppMedia.iconList.length],
          );
        },
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
