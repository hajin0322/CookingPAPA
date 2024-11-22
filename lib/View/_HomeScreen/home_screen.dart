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
  const HomeScreenState({super.key}); // 홈 화면 상태 클래스 생성자

  @override
  State<HomeScreenState> createState() => _HomeScreenState(); // 상태 관리 클래스 생성
}

class _HomeScreenState extends State<HomeScreenState> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const AIText(
          givenText: 'Hello!',
        ),
        RecipeSection(
          title: "Recommended For You",
          imagePath: AppMedia.food1,
          ico: AppMedia.ai_icon,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DetailRecipe()));
          },
          additionalInfo: 'Ingredients: 사용한 재료 목록\nPreparation Time: 요리 예상 시간 OR 간단한 설명같은거 넣으면 될듯',
        ),
      ])
    ]);
  }
}
