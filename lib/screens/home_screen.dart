import 'package:flutter/material.dart';
import 'package:group_project/base/res/media.dart';
import 'package:group_project/base/widgets/ai_text.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import 'package:group_project/base/widgets/recipe_section.dart';
import 'package:group_project/screens/detail_recipe.dart';
import '../base/res/styles/app_styles.dart';

// 홈 화면 클래스
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // 홈 화면 클래스 생성자

  @override
  Widget build(BuildContext context) {
    // 홈 화면 위젯 구조
    return Scaffold(
      appBar: const CustomAppBar(title: "What are you Cooking Today?"),
      body: const HomeScreenState(),
      backgroundColor: AppStyles.bgColor,
    );
  }
}

// 홈 화면 상태 클래스
class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key}); // 홈 화면 상태 클래스 생성자

  @override
  State<HomeScreenState> createState() => _HomeScreenState(); // 상태 관리 클래스 생성
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
                // 레시피 상세 페이지로 이동
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
