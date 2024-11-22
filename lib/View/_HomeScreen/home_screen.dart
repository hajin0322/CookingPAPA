import 'package:flutter/material.dart';

import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import 'ai_text.dart';
import '../ViewBase/app_bar.dart';
import '../_DetailRecipe/recipe_section.dart';
import '../_DetailRecipe/detail_recipe.dart';

// 홈 화면 클래스
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AIText 위젯에 동적인 텍스트를 전달합니다.
            const AIText(),
            RecipeSection(
              title: "Recommended for you",
              imagePath: AppMedia.food1,
              ico: AppMedia.ai_icon,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailRecipe(dishName: '', recipe: '', imagePrompt: '')),
                );
              },
              additionalInfo: '재료: 사용한 재료 목록\n준비 시간: 요리 예상 시간 또는 간단한 설명을 추가하세요.',
            ),
          ],
        ),
      ],
    );
  }
}
