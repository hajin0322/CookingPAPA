import 'package:flutter/material.dart';
import '../../Model/ingredient.dart';
import '../../Repository/ingredient_list_repository.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import 'search_categories.dart';
import 'recipe_search_results.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({super.key});

  @override
  State<RecipeSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  final IngredientRepository _ingredientRepository = IngredientRepository();
  List<String> selectedTexts = [];

  // Category 리스트를 저장할 변수
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  // IngredientRepository에서 데이터를 가져와 Category 객체로 변환
  void _loadCategories() {
    List<String> categoryNames = _ingredientRepository.getAllCategories();

    categories = categoryNames.map((categoryName) {
      List<Ingredient> ingredients = _ingredientRepository.getIngredientsByCategory(categoryName);

      List<Category> subCategories = ingredients.map((ingredient) {
        return Category(name: ingredient.name);
      }).toList();

      return Category(name: categoryName, subCategories: subCategories);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Recipe Search"),
      body: SearchCategories(
        categories: categories,
        onSelectionChanged: (List<String> selectedItems) {
          setState(() {
            selectedTexts = selectedItems;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedTexts.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeSearchResults(
                  result: selectedTexts,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select at least one ingredient')),
            );
          }
        },
        backgroundColor: AppStyles.bgColor,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
