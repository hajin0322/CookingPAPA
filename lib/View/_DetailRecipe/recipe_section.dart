import 'package:flutter/material.dart';
import '../../Model/recipe.dart';
import 'detail_recipe.dart';
import 'dart:typed_data';

class RecipeSection extends StatelessWidget {
  final Recipe recipe;

  const RecipeSection({
    super.key,
    required this.recipe,
  });
  //여기서 이 onTap 콜백은 어디서 쓰이는것인지?
  //아 레시피 섹션을 지금 위젯으로 만들어둬서 필요하다 이 말인거구나?
  @override
  Widget build(BuildContext context) {
    final bool isTablet = _isTablet(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRecipe(recipe: recipe),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isTablet ? _buildTabletLayout() : _buildMobileLayout(),
        ),
      ),
    );
  }

  /// 태블릿 여부를 판단하는 메서드
  bool _isTablet(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;
    return MediaQuery.of(context).size.shortestSide >= 600 && aspectRatio < 1.6;
  }

  /// 태블릿 레이아웃
  Widget _buildTabletLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(flex: 1, height: 150),
        const SizedBox(width: 16),
        Expanded(flex: 2, child: _buildTextContent()),
      ],
    );
  }

  /// 모바일 레이아웃
  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(flex: null, height: 200),
        const SizedBox(height: 16),
        _buildTextContent(),
      ],
    );
  }

  /// 이미지 위젯
  Widget _buildImage({int? flex, required double height}) {
    // base64 문자열을 Uint8List로 디코딩
    final Uint8List imageBytes = recipe.imageBytes; // Recipe 클래스의 getter 사용

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.memory(
        imageBytes,
        height: height,
        fit: BoxFit.cover,
      ),
    );

    return flex != null
        ? Expanded(flex: flex, child: imageWidget)
        : imageWidget;
  }


  /// 텍스트 콘텐츠 위젯
  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipe.recipeTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          recipe.recipeContent.split('\n').first,
          style: const TextStyle(
            fontSize: 14,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
