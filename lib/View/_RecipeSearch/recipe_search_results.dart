import 'dart:math';

import 'package:flutter/material.dart';
import 'package:group_project/View/ViewBase/app_bar.dart';
import 'package:group_project/View/_DetailRecipe/recipe_section.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../_DetailRecipe/detail_recipe.dart';

class RecipeSearchResults extends StatelessWidget {
  final List<String> result;

  const RecipeSearchResults({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    String getRandomIcon() {
      final random = Random();
      return AppMedia.iconList[random.nextInt(AppMedia.iconList.length)];
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Search Results", showBackButton: true),
      body: ListView(
        children: [
          Container(

            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 10),
            decoration: BoxDecoration(
              color: AppStyles.layoutColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Result for: ",
                    style: AppStyles.headLineStyle2
                        .copyWith(color: AppStyles.textColor)),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: result.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(result[index],
                          style: AppStyles.textStyle
                              .copyWith(color: AppStyles.textColor));
                    }),
              ],
            ),
          ),
          const SizedBox(height: 25),
          RecipeSection(
              title: "Kimchi Soup",
              imagePath: AppMedia.recipe1,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailRecipe()));
              },
              additionalInfo: 'Ingredients: 사용한 재료 목록\nPreparation Time: 요리 예상 시간 OR 간단한 설명같은거 넣으면 될듯',
              ico: getRandomIcon()),
          RecipeSection(
              title: "Tofu Kimchi",
              imagePath: AppMedia.recipe2,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailRecipe()));
              },
              additionalInfo: 'Ingredients: 사용한 재료 목록\nPreparation Time: 요리 예상 시간 OR 간단한 설명같은거 넣으면 될듯',
              ico: getRandomIcon()),
          RecipeSection(
              title: "Tofu Kimchi",
              imagePath: AppMedia.recipe2,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailRecipe()));
              },
              additionalInfo: 'Ingredients: 사용한 재료 목록\nPreparation Time: 요리 예상 시간 OR 간단한 설명같은거 넣으면 될듯',
              ico: getRandomIcon())
        ],
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
