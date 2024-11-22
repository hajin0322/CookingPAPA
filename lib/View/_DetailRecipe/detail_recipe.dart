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
      appBar: CustomAppBar(title: dishName),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recipe:", style: AppStyles.headLineStyle3),
            const SizedBox(height: 8),
            Text(recipe, style: AppStyles.textStyle),
            const SizedBox(height: 16),
            Text("Image Prompt:", style: AppStyles.headLineStyle3),
            const SizedBox(height: 8),
            Text(imagePrompt, style: AppStyles.textStyle),
          ],
        ),
      ),
    );
  }
}
