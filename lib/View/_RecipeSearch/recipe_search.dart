import 'package:flutter/material.dart';
import 'package:group_project/Repository/ingredient_list_repository.dart';
import 'package:group_project/View/_RecipeSearch/search_button.dart';
import 'package:group_project/View/_RecipeSearch/search_categories.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'package:provider/provider.dart';
import '../../Model/ingredient_list.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({super.key});

  @override
  State<RecipeSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  late IngredientRepository _ingredientRepository;
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    _ingredientRepository = IngredientRepository();
    categories = _ingredientRepository.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IngredientListViewModel(IngredientList()),
      child: Scaffold(
        appBar: const CustomAppBar(title: "Recipe Search"),
        body: Container(
          color: AppStyles.bgColor,
          child: SearchCategories(
              categories: categories,
              ingredientRepository: _ingredientRepository),
        ),
        floatingActionButton: const SearchButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
