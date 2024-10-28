import 'package:flutter/material.dart';
import 'package:group_project/base/res/media.dart';
import 'package:group_project/base/widgets/ai_text.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import 'package:group_project/base/widgets/recipe_section.dart';
import 'package:group_project/screens/detail_recipe.dart';
import '../base/res/styles/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "What are you Cooking Today?"),
      body: const HomeScreenState(),
      backgroundColor: AppStyles.bgColor,
    );
  }
}

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  State<HomeScreenState> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AIText(
            givenText: 'Hello!',
          ),
          HomeScreenRecipeSection(
            title: "Recommended For You",
            imagePath: AppMedia.food1,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailRecipe()),
              );
            },
            edgeTop: 20,
          )
        ]),
      ],
    );
  }
}
