import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'recipe_search_results.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        final ingredientListViewModel = context.read<IngredientListViewModel>();
        final selectedIngredients =
            ingredientListViewModel.ingredientList.selectedIngredientList;

        if (selectedIngredients.isNotEmpty) {
          Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    RecipeSearchResults(
                      result: selectedIngredients.map((e) => e.name).toList(),
                    ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // 오른쪽에서 시작
                  const end = Offset.zero; // 원래 위치로 이동
                  const curve = Curves.ease;

                  final tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  final offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                }),
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
      label: Text("Start Cooking", style: AppStyles.headLineStyle3),
      icon: const Icon(Icons.search),
    );
  }
}
