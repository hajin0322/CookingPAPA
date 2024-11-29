import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:group_project/View/_RecipeSearch/search_button.dart';
import 'package:group_project/View/_RecipeSearch/search_categories.dart';
import 'package:group_project/ViewModel/ingredient_list_view_model.dart';
import 'package:group_project/Model/ingredient_list.dart';
import '../ViewBase/app_bar.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({super.key});

  @override
  State<RecipeSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = IngredientList().categories; // IngredientList에서 카테고리 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IngredientListViewModel(IngredientList()),
      child: Scaffold(
        appBar: const CustomAppBar(title: "Recipe Search"),
        body: Container(
          color: AppStyles.bgColor,
          child: const SearchCategories(),
        ),
        floatingActionButton: const SearchButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
