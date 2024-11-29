import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/recipe_list_view_model.dart';
import '../_DetailRecipe/recipe_section.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    //json encoding decoding으로 할것인가
    //아니면 그냥 직관적인 상태관리를 할것인가
    //항상 타협을 봐야한다는거구나.
    //오늘은 여기까지 ㅋㅋ
    final starredRecipes = context.watch<RecipeListViewModel>().getStarredRecipes();

    return Scaffold(
      appBar: AppBar(title: const Text("My Fridge")),
      body: ListView.builder(
        itemCount: starredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = starredRecipes[index];
          return RecipeSection(
            recipe: recipe,
          );
        },
      ),
    );
  }
}
