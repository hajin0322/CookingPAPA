import 'package:flutter/material.dart';
import 'package:group_project/base/widgets/recipe_section.dart';
import 'package:group_project/screens/detail_recipe.dart';
import '../res/styles/app_styles.dart';

// 레시피 모델 클래스
class RecipePreview {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  RecipePreview({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });
}

class RecViewWidget extends StatelessWidget {
  final double topPaddingValue;
  final double leftPaddingValue;
  final double rightPaddingValue;

  const RecViewWidget({
    super.key,
    this.topPaddingValue = 10,
    this.leftPaddingValue = 40,         // left 패딩값
    this.rightPaddingValue = 40,        // right 패딩값
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePadding(title: 'Recently Viewed 5 Recipes',topPaddingValue: 100,bottomPaddingValue: 0,),
        Padding(
          padding: EdgeInsets.only(left: leftPaddingValue, right: rightPaddingValue, top: topPaddingValue),
          child:
            Container(
              decoration: BoxDecoration(
              color: AppStyles.simpleBarColor, // simple bar background 설정
              borderRadius: BorderRadius.circular(15),
              ),
              child: const RecViewWidgetBody(),
            ),
        ),
      ],
    );
  }
}

// 레시피 큐 위젯
class RecViewWidgetBody extends StatelessWidget {
  const RecViewWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 샘플 레시피 데이터
    List<RecipePreview> recipeList = [
      RecipePreview(
        title: 'doenjang-jjigae',
        imagePath: 'assets/CookingPAPA/doenjang-jjigae.png', // 실제 이미지 경로로 변경해야 합니다.
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailRecipe(),
            ), // 최근 5개 페이지로 이동하는 로직
          );
        },
      ),
      RecipePreview(
        title: 'kimchi_jjigae',
        imagePath: 'assets/CookingPAPA/kimchi_jjigae.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailRecipe(),
            ), // 최근 5개 페이지로 이동하는 로직
          );
        },
      ),
      RecipePreview(
        title: 'fresh_bacon_salad',
        imagePath: 'assets/CookingPAPA/fresh_bacon_salad.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailRecipe(),
            ), // 최근 5개 페이지로 이동하는 로직
          );
        },
      ),
      RecipePreview(
        title: 'classic_deli-style_sandwich',
        imagePath: 'assets/CookingPAPA/classic_deli-style_sandwich.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailRecipe(),
            ), // 최근 5개 페이지로 이동하는 로직
          );
        },
      ),
      RecipePreview(
        title: 'aglio_e_olio_pasta',
        imagePath: 'assets/CookingPAPA/aglio_e_olio_pasta.png',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailRecipe(),
            ), // 최근 5개 페이지로 이동하는 로직
          );
        },
      ),
    ];

    return Container(
      height: 350,  // 각 레시피 섹션 높이 지정
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  // 가로 스크롤 설정
        itemCount: recipeList.length,
        itemBuilder: (context, index) {
          final recipe = recipeList[index];
          return MyFridgeRecipeSection(
              title: recipe.title,
              imagePath: recipe.imagePath,
              onTap: recipe.onTap,
            );
        },
      ),
    );
  }
}