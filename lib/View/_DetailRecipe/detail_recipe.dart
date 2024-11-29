import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/recipe.dart';
import '../../ViewModel/recipe_list_view_model.dart';

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
    final recipeListViewModel = Provider.of<RecipeListViewModel>(context, listen: false);

    // 스냅샷으로 데이터 가져오기 (정적 데이터로 가져오기!)
    final recipeSnapshot = recipeListViewModel.getRecipeSnapshot(recipe);

    // isStarred 상태만 구독해서 전체 리빌드하게 하지 않기!
    final isStarred = context.select<RecipeListViewModel, bool>(
          (viewModel) => viewModel.getIsStarred(recipe),
    );

    final Uint8List imageBytes = recipe.imageBytes;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipeSnapshot['title']),
        actions: [
          IconButton(
            icon: Icon(
              isStarred ? Icons.star : Icons.star_border, // 아이콘 결정
              color: isStarred ? Colors.yellow : Colors.grey, // 색상 결정
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
            Image.memory(imageBytes),
            const SizedBox(height: 16.0),
            Text(
              recipeSnapshot['content'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}