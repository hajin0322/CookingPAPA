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
    return Scaffold(
      appBar: const CustomAppBar(title: "Search Results"),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text("[Selected Ingredients]",
                  style: AppStyles.headLineStyle2
                      .copyWith(color: AppStyles.textColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(result[index],
                        style: AppStyles.headLineStyle3
                            .copyWith(color: AppStyles.textColor));
                  }),
            ),
            RecipeSection(
                title: "Kimchi Soup",
                imagePath: AppMedia.recipe1,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailRecipe()));
                },
                ico: AppMedia.ai_icon),
            RecipeSection(
                title: "Tofu Kimchi",
                imagePath: AppMedia.recipe2,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailRecipe()));
                },
                ico: AppMedia.ai_icon),
            RecipeSection(
                title: "Tofu Kimchi",
                imagePath: AppMedia.recipe2,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailRecipe()));
                },
                ico: AppMedia.ai_icon)
            /*RecipeCard(
              imagePath: AppMedia.recipe1,
              recipeName: "Kimchi Soup(김치찌개)",
            ),
            const SizedBox(height: 20),
            RecipeCard(
              imagePath: AppMedia.recipe2,
              recipeName: "Tofu Kimchi(두부김치)",
            ),*/
          ],
        ),
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
/*
class RecipeCard extends StatelessWidget {
  final String imagePath;
  final String recipeName;

  const RecipeCard({
    Key? key,
    required this.imagePath,
    required this.recipeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppStyles.layoutColor),
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: size.width * 0.07,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipeName,
                  style: AppStyles.headLineStyle2,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailRecipe(),
                      ),
                    );
                  },
                  child: const Text("Let's Cook!"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
