import 'dart:async';
import 'dart:typed_data'; // 명시적으로 import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Model/recipe.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import 'ai_text.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';
import '../_DetailRecipe/detail_recipe.dart';

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
  Uint8List? imageData;
  ImageProvider? recipeImage; // ImageProvider 타입의 이미지 저장
  Recipe? recommendedRecipe;

  @override
  void initState() {
    super.initState();
    _loadLocalImage();
  }

  /// 로컬 이미지 데이터를 로드하고 `MemoryImage`로 변환
  Future<void> _loadLocalImage() async {
    try {
      final data = await rootBundle.load(AppMedia.food1); // 이미지 로드
      imageData = data.buffer.asUint8List();

      setState(() {
        recipeImage = MemoryImage(imageData!); // MemoryImage로 변환
        recommendedRecipe = Recipe(
          recipeTitle: "Delicious Pasta",
          recipeImage: recipeImage!,
          recipeContent: """
Ingredients:
- Pasta
- Sauce

Instructions:
1. Cook pasta.
2. Add sauce.
""",
        );
      });
    } catch (e) {
      print("Error loading local image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AIText(
              givenText: 'Hello!',
            ),
            if (recommendedRecipe != null)
              RecipeSection(
                recipe: recommendedRecipe!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailRecipe(recipe: recommendedRecipe!),
                    ),
                  );
                },
              )
            else
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ],
    );
  }
}
