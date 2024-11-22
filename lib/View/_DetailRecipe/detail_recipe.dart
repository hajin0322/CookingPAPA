import 'package:flutter/material.dart';
import 'package:group_project/View/ViewBase/app_bar.dart';
import '../ViewAsset/styles/app_styles.dart';

class DetailRecipe extends StatelessWidget {
  final String dishName;
  final String recipe;
  final String imagePrompt;

  const DetailRecipe({
    super.key,
    required this.dishName,
    required this.recipe,
    required this.imagePrompt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: dishName,
          showBackButton: true,
        ),
        body: DetailRecipeState(
          dishName: dishName,
          recipe: recipe,
          imagePrompt: imagePrompt,
        ));
  }
}

class DetailRecipeState extends StatefulWidget {
  final String dishName;
  final String recipe;
  final String imagePrompt;

  const DetailRecipeState(
      {super.key,
      required this.dishName,
      required this.recipe,
      required this.imagePrompt});

  @override
  State<DetailRecipeState> createState() => _DetailRecipeStateState();
}

class _DetailRecipeStateState extends State<DetailRecipeState> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recipe:", style: AppStyles.headLineStyle2),
              const SizedBox(height: 8),
              Text(widget.recipe, style: AppStyles.headLineStyle3),
              const SizedBox(height: 16),
              Text("Image Prompt:", style: AppStyles.headLineStyle2),
              const SizedBox(height: 8),
              Text(widget.imagePrompt, style: AppStyles.textStyle),
            ],
          )
        ]);
  }
}
