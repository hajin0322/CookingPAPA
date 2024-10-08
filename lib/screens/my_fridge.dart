import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import 'package:group_project/screens/recently_viewed_recipes.dart';
import 'package:group_project/screens/saved_recipe.dart';
import '../base/widgets/app_bar.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "My Fridge"),
      body: MyFridgeBody(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeSection(
          title: 'Recently viewed 5 Recipes',
          imagePath: 'assets/CookingPAPA/doenJang_ggiGae.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecentlyViewedRecipe()),
            );// 최근 5개 페이지로 이동하는 로직
          },
        ),
        RecipeSection(
          title: 'Saved Recipes',
          imagePath: 'assets/CookingPAPA/kimchiggigae.jpg',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SavedRecipe()),
            );// 레시피 저장 페이지로 이동하는 로직
          },
        ),
      ],
    );
  }
}

class RecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const RecipeSection({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 16),
          child: Text(
            title,
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 70, top: 20, bottom: 30),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: 300,
                height: 267,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}