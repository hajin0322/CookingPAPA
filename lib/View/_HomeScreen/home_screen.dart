
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
      body: ListView(
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
      backgroundColor: AppStyles.bgColor,
      floatingActionButton: const RecommendButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
