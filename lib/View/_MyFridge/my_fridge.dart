import 'package:flutter/material.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/recipe_list_view_model.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    //json encoding decoding으로 할것인가
    //아니면 그냥 직관적인 상태관리를 할것인가
    //항상 타협을 봐야한다는거구나.
    //오늘은 여기까지 ㅋㅋ
    final starredRecipes =
        context.watch<RecipeListViewModel>().getStarredRecipes();

    return Scaffold(
      appBar: const CustomAppBar(title: "My Fridge"),
      body: starredRecipes.isEmpty
          ? Center(
              child: Text(
              "No Starred Recipes!",
              style:
                  AppStyles.headLineStyle2.copyWith(color: AppStyles.textColor),
            ))
          : ListView.builder(
              itemCount: starredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = starredRecipes[index];
                return RecipeSection(
                  recipe: recipe,
                );
              }),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
