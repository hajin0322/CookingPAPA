import 'package:flutter/material.dart';
import 'package:group_project/View/_Settings/app_info_popup.dart';
import 'package:group_project/View/_Settings/reset_popup.dart';
import 'package:group_project/ViewModel/recipe_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/data_source_view_model.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import 'settings_section.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSourceViewModel =
        Provider.of<DataSourceViewModel>(context, listen: false);
    final ingredientList = dataSourceViewModel.ingredientListViewModel;
    final recipeList = Provider.of<RecipeListViewModel>(context, listen: false);

    void showResetPopup() {
      showDialog(
          context: context,
          builder: (BuildContext context) => const ResetPopup()).then((result) {
        if (result == true) {
          recipeList.resetStarredRecipes();
          ingredientList.resetUsedList();
          dataSourceViewModel.recommendedRecipe = null;
        }
      });
    }

    void showAppInfoPopup() {
      showDialog(
          context: context,
          builder: (BuildContext context) => const AppInfoPopup());
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Settings"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsSection(
                title: "Reset Fridge",
                onTap: showResetPopup,
              ),
              SettingsSection(
                title: "App Info",
                onTap: showAppInfoPopup,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    AppMedia.cover,
                    width: 280,
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
