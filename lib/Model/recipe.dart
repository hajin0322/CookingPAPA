import 'package:flutter/cupertino.dart';

class Recipe {
  final String recipeTitle; // 레시피 제목
  final ImageProvider recipeImage; // 레시피 이미지 (ImageProvider로 변경)
  final String recipeContent; // 상세 레시피
  bool isStarred = false; // 즐겨찾기 여부

  Recipe({
    required this.recipeTitle,
    required this.recipeImage, // ImageProvider로 입력받음
    required this.recipeContent,
  });
}
