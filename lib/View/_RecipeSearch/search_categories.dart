import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';

class SearchCategories extends StatelessWidget {
  const SearchCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredientListViewModel = context.watch<IngredientListViewModel>();
    final categories = ingredientListViewModel.categories;

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final ingredients =
            ingredientListViewModel.getIngredientsByCategory(category);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
          child: ExpansionTile(
            backgroundColor: AppStyles.layoutColor,
            collapsedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            title: Text(
              category,
              style: AppStyles.headLineStyle3,
            ),
            children: ingredients.map((ingredient) {
              final isSelected = ingredientListViewModel
                  .ingredientList.selectedIngredientList
                  .contains(ingredient);

              return ListTile(
                title: Text(
                  ingredient.name,
                  style: AppStyles.textStyle,
                ),
                trailing: Icon(
                  isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: isSelected ? AppStyles.textColor : Colors.grey,
                ),
                onTap: () {
                  final success =
                      ingredientListViewModel.selectionChange(ingredient);

                  if (!success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("You can't select more than 5 ingredients!"),
                      ),
                    );
                  }
                },
                onLongPress: isSelected
                    ? () {
                        ingredientListViewModel.resetSelectedList();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("deleted all selected ingredients!")));
                      }
                    : null,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
