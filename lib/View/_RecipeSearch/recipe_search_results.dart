import 'package:flutter/material.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../_DetailRecipe/detail_recipe.dart';

class RecipeSearchResults extends StatelessWidget {
  final List<String> result;

  const RecipeSearchResults({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String resultText = result.join(', ');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Selected Ingredients: $resultText",
            style: AppStyles.headLineStyle3,
          ),
          const SizedBox(height: 20),
          RecipeCard(
            imagePath: AppMedia.recipe1,
            recipeName: "Kimchi Soup(김치찌개)",
          ),
          const SizedBox(height: 20),
          RecipeCard(
            imagePath: AppMedia.recipe2,
            recipeName: "Tofu Kimchi(두부김치)",
          ),
        ],
      ),
    );
  }
}

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
