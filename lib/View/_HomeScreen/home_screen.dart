import 'package:flutter/material.dart';
import '../../ViewModel/data_source_view_model.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';
import '../_HomeScreen/recommend_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "What are you Cooking Today?"),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<DataSourceViewModel>(
                    builder: (context, viewModel, child) {
                      return viewModel.recommendedRecipe != null
                          ? RecipeSection(recipe: viewModel.recommendedRecipe!)
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Press the Recommend button to get a recipe suggestion!',
                                  style: TextStyle(fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton.extended(
              onPressed: () async {
                final recipe = await context.read<DataSourceViewModel>().generateRecipeFromUsedIngredients();
                if (recipe == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please active Recipe Search least 1 time!')),
                  );
                }
              },
              backgroundColor: AppStyles.bgColor,
              label: const RecommendButton(),
            ),
          ),
        ],
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
