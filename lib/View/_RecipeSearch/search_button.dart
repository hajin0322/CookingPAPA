import 'dart:async';

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
    final dataSourceViewModel =
        Provider.of<DataSourceViewModel>(context, listen: false);

    return FloatingActionButton.extended(
      onPressed: () async {
        final ingredientViewModel = context.read<IngredientListViewModel>();

        // 검색 시작 전에 사용된 재료 목록 초기화
        await ingredientViewModel.initializeUsedIngredients();

        final selectedIngredients =
            ingredientViewModel.ingredientList.selectedIngredientList;

        if (selectedIngredients.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Please select at least one ingredient')),
          );
          return;
        }

        try {
          final combinedIngredients =
              selectedIngredients.map((e) => e.name).join(', ');

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return PopScope(
                  canPop: false,
                  child: AlertDialog(
                    titlePadding: const EdgeInsets.all(20),
                    title: Center(
                      child: Text(
                        "Wait a minute!",
                        style: AppStyles.headLineStyle2
                            .copyWith(color: AppStyles.textColor),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AppStyles.textColor),
                        const SizedBox(height: 20),
                        Text(
                          "PAPA is cooking recipes for you.",
                          style: AppStyles.textStyle,
                        ),
                        Text(
                          "DON'T TURN OFF THIS APP!",
                          style: AppStyles.textStyle
                              .copyWith(color: AppStyles.textColor),
                        )
                      ],
                    ),
                  ),
                );
              });

          // Generate recipes using AI
          // 타임아웃 구현
          final recipes = await Future.any([
            dataSourceViewModel.generateMultipleRecipes(combinedIngredients, 3),
            Future.delayed(const Duration(minutes: 3), () {
              throw TimeoutException(
                  "Recipe generation timed out after 3 minutes.");
            }),
          ]);

          Navigator.pop(context);

          // Navigate to results screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeSearchResults(results: recipes),
            ),
          );
          ingredientViewModel.addUsedIngredient(selectedIngredients);
        } catch (e) {
          // 타임아웃 예외 처리
          Navigator.pop(context); // 로딩창 닫기
          print('Failed to generate recipes: $e');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to generate recipes: $e')));
        }
      },
      backgroundColor: AppStyles.bgColor,
      label: Text("Start Cooking",
          style: AppStyles.headLineStyle3.copyWith(color: AppStyles.textColor)),
      icon: Icon(Icons.search, color: AppStyles.textColor,),
    );
  }
}
