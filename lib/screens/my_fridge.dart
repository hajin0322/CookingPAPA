import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import 'package:group_project/screens/recently_viewed_recipes.dart';
import 'package:group_project/screens/saved_recipe.dart';
import '../base/widgets/app_bar.dart';
import '../base/widgets/recipe_section.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "My Fridge"),
      body: const MyFridgeBody(),
      backgroundColor: AppStyles.bgColor,
    );
  }
}

class MyFridgeBody extends StatefulWidget {
  const MyFridgeBody({super.key});

  @override
  State<StatefulWidget> createState() => _MyFridgeBodyState();
}

class _MyFridgeBodyState extends State<MyFridgeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyFridgeRecipeSection(
            title: 'Recently viewed 5 Recipes',
            imagePath: 'assets/CookingPAPA/doenJang_ggiGae.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RecentlyViewedRecipe()),
              ); // 최근 5개 페이지로 이동하는 로직
            },
          ),
          MyFridgeRecipeSection(
            title: 'Saved Recipes',
            imagePath: 'assets/CookingPAPA/kimchiggigae.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavedRecipe()),
              ); // 레시피 저장 페이지로 이동하는 로직
            },
          ),
        ],
      ),
    ]);
  }
}
