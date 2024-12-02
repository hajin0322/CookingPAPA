import 'package:flutter/material.dart';
import 'package:group_project/View/_HomeScreen/ai_text.dart';
import '../../ViewModel/data_source_view_model.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';
import '../_HomeScreen/recommend_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String targetText = ""; // 초기값

  @override
  void initState() {
    super.initState();
    makeApiCall(); // 초기화 후 API 호출
  }

  /// AI 응답을 가져와 `targetText` 업데이트
  void makeApiCall() async {
    final dataSourceViewModel =
        Provider.of<DataSourceViewModel>(context, listen: false);
    final String response = await dataSourceViewModel.generateAIResponse(
        "Hi Cooking PAPA! I'm your chef. I want to get recipes from you!");

    setState(() {
      targetText = response; // 응답을 상태로 저장
      print(targetText);
    });
  }

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
                  AIText(
                    targetText: targetText, // 상태로 전달된 텍스트
                  ),
                  Consumer<DataSourceViewModel>(
                    builder: (context, viewModel, child) {
                      return viewModel.recommendedRecipe != null
                          ? RecipeSection(recipe: viewModel.recommendedRecipe!)
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'PAPA wanna recommend you some Recipes!\nClick the Recommend Button!',
                                  style: AppStyles.textStyle,
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
                              CircularProgressIndicator(
                                  color: AppStyles.textColor),
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

                final recipe = await context
                    .read<DataSourceViewModel>()
                    .generateRecipeFromUsedIngredients();

                Navigator.pop(context);

                if (recipe == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Please activate Recipe Search at least 1 time!'),
                    ),
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
