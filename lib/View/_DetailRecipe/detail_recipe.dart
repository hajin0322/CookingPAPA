import 'dart:typed_data';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:provider/provider.dart';
import '../../Model/recipe.dart';
import '../../ViewModel/recipe_list_view_model.dart';
import '../ViewBase/app_bar.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;

  const DetailRecipe({
    super.key,
    required this.recipe,
  });

  //접근은 간접접근으로 하자.
  //recipe 객체를 받아오는건 메모리주소 참조를 위해서 받아오게 하고.
  //recip의 상태변화와 참조는 viewmodel을 통해서 하는거야.
  //우리가 title, isStarred, recipeImage 같은것들을 snapshot으로 한방에 데이터 정보 덩어리만 받아와서 쓰는거지
  //snapshot으로 json형태로 받아오는것 조차도 만약 데이터가 커지면 하드코딩하는게 아니라 라이브러리를 사용할 수 있음

  @override
  Widget build(BuildContext context) {
    // ViewModel을 listen: false로 가져와서 상태 변경을 구독하지 않음
    final recipeListViewModel =
        Provider.of<RecipeListViewModel>(context, listen: false);

    // 스냅샷으로 데이터 가져오기 (정적 데이터로 가져오기!)
    final recipeSnapshot = recipeListViewModel.getRecipeSnapshot(recipe);

    // isStarred 상태만 구독해서 전체 리빌드하게 하지 않기!
    final isStarred = context.select<RecipeListViewModel, bool>(
      (viewModel) => viewModel.getIsStarred(recipe),
    );

    final Uint8List imageBytes = recipe.imageBytes;

    List<String> recipes = recipe.recipeContent.split('\n');

    Map<String, List<String>> indexedRecipes = {
      'Description': [recipes[0]],
      'Ingredients': recipes[1]
          .replaceAll('[', '') // '[' 제거
          .replaceAll('\\]', '') // ']' 제거
          .split(r'\, '), // '\, ' 기준으로 분리
      'Instructions': recipes[2]
          .replaceAll('[', '') // '[' 제거
          .replaceAll('\\]', '') // ']' 제거
          .split(r'\, ') // '\, ' 기준으로 분리
    };

    return Scaffold(
      appBar: CustomAppBar(
        title: recipeSnapshot['title'],
        showBackButton: true,
        actions: [
          IconButton(
            icon: Icon(
              isStarred
                  ? FluentSystemIcons.ic_fluent_star_filled
                  : FluentSystemIcons.ic_fluent_star_regular, // 아이콘 결정
              color: isStarred
                  ? AppStyles.textColor
                  : AppStyles.textColor, // 색상 결정
            ),
            onPressed: () {
              recipeListViewModel.changeStarred(recipe); // 상태 변경
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(imageBytes), // 이미지를 표시
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true, // 높이를 제한하여 Column과 호환
              physics: const NeverScrollableScrollPhysics(), // 내부 스크롤 비활성화
              itemCount: recipes.length, // 리스트의 길이
              itemBuilder: (context, index) {
                final entry = indexedRecipes.entries.toList()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        // Map의 키 (e.g., Description, Ingredients, Instructions)
                        style: AppStyles.headLineStyle2,
                        ),
                      const SizedBox(height: 4.0),
                      ListView.builder(
                        shrinkWrap: true, // 높이를 제한하여 Column과 호환
                        physics: const NeverScrollableScrollPhysics(), // 내부 스크롤 비활성화
                        itemCount: entry.value.length, // 각 리스트의 길이
                        itemBuilder: (context, subIndex) {
                          return Text(
                              entry.value[subIndex], // 리스트의 각 항목
                              style: AppStyles.headLineStyle3,
                            );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
