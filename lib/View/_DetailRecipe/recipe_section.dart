import 'package:flutter/material.dart';
import '../../Model/recipe.dart';

class RecipeSection extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;

  const RecipeSection({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTablet = _isTablet(context);

    return GestureDetector(
      onTap: onTap,
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
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image(
        image: recipe.recipeImage, // ImageProvider 사용
        fit: BoxFit.cover,
        width: double.infinity,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          print("Error loading image: $error");
          return const Placeholder(fallbackHeight: 150);
        },
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
