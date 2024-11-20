import 'dart:ui';

//레시피 모델
class Recipe {
  final String recipeTitle; //레시피 제목
  final Image recipeImage;  //레시피 이미지
  final String recipeContent; // 상세 레시피
  bool isStarred = false;   //레시피 isStarred값. view용 컴포넌트, 당연히 false로 초기화

  //생성자로 만들때 제목, 이미지, 상세 레시피 이렇게 세개 필요함
  Recipe ({
    required this.recipeTitle,
    required this.recipeImage,
    required this.recipeContent,
  });
}