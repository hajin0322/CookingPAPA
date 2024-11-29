import 'dart:typed_data';
import 'dart:convert';

class Recipe {
  final String recipeTitle;
  final String recipeImage; // base64 문자열로 저장
  final String recipeContent;
  bool isStarred = false;

  Recipe({
    required this.recipeTitle,
    required this.recipeImage,
    required this.recipeContent,
  });

  // Uint8List로 변환하는 getter
  Uint8List get imageBytes => base64Decode(recipeImage);

  // Uint8List를 Recipe로 변환하는 팩토리 메서드
  factory Recipe.fromUint8List({
    required String title,
    required Uint8List image,
    required String content,
  }) {
    return Recipe(
      recipeTitle: title,
      recipeImage: base64Encode(image),
      recipeContent: content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': recipeTitle,
      'content': recipeContent,
      'image': recipeImage, // 이미 base64 문자열
      'isStarred': isStarred,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeTitle: json['name'],
      recipeContent: json['content'],
      recipeImage: json['image'],
    )..isStarred = json['isStarred'] ?? false;
  }
}
