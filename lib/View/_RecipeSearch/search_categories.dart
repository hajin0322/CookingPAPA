import 'package:flutter/material.dart';
import 'package:group_project/Repository/ingredient_list_repository.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchCategories extends StatelessWidget {
  final IngredientRepository ingredientRepository;
  final List<String> categories;

  const SearchCategories(
      {super.key,
      required this.ingredientRepository,
      required this.categories});

  @override
  Widget build(BuildContext context) {
    final ingredientListViewModel = context.watch<IngredientListViewModel>();

    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final ingredients =
              ingredientRepository.getIngredientsByCategory(category);
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 40 - 17),
            child: ExpansionTile(
                backgroundColor: AppStyles.layoutColor,
                collapsedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
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
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isSelected ? Colors.green : Colors.grey,
                    ),
                    onTap: () {
                      final success =
                          ingredientListViewModel.selectionChange(ingredient);

                      if (!success) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "You can't select more than 5 ingredients!")));
                      }
                    },
                  );
                }).toList()),
          );
        });
  }
}
