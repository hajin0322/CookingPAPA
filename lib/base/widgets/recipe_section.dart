import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';

import '../res/media.dart';
import '../res/styles/app_styles.dart';

class TitlePadding extends StatelessWidget {
  final String title;
  final double leftPaddingValue;
  final double rightPaddingValue;
  final double topPaddingValue;
  final double bottomPaddingValue;
  final TextStyle? textStyle;   //textstyle도 지정할 수 있도록 만듦. 타이틀 텍스트를 변경할 수 있도록.. 상황에 맞게

  // leftPaddingValue의 기본값을 40으로 설정, topPaddingValue 또한 기본값 10으로 설정. 내가 다른곳에서 변수 추가하면 바꾸기 가능합니다.
  //텍스트 패딩을 또 컨테이너가 감쌀 수 있는 상황이 발생해서. container안에서의 padding도 설정해야해서 이렇게 추가함.

  const TitlePadding({
    super.key,
    required this.title,
    this.leftPaddingValue = 40,
    this.topPaddingValue = 10,
    this.bottomPaddingValue = 10,
    this.rightPaddingValue = 40,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // leftPaddingValue가 주어진 값에 따라 변경되도록 설정
      padding: EdgeInsets.only(left: leftPaddingValue, top: topPaddingValue, bottom: bottomPaddingValue),
      child: Text(
        title,
        style: textStyle ?? AppStyles.headLineStyle2,
      ),
    );
  }
}

class ImagePadding extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double topPaddingValue;
  final double rightPaddingValue;
  final double leftPaddingValue;
  final double bottomPaddingValue;
  final double imageWidth;

  const ImagePadding({
    super.key,
    required this.imagePath,
    required this.onTap,
    this.topPaddingValue = 10,
    this.rightPaddingValue = 40,
    this.leftPaddingValue = 40,
    this.bottomPaddingValue = 10,
    this.imageWidth = 400
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: leftPaddingValue, right: rightPaddingValue, top: topPaddingValue, bottom: bottomPaddingValue),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            width: imageWidth,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// 이거 근형꺼
class MyFridgeRecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const MyFridgeRecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitlePadding(title: title, leftPaddingValue: 20,),
        ImagePadding(
            imagePath: imagePath, onTap: onTap, imageWidth: size.width * 0.7, topPaddingValue: 20, rightPaddingValue: 20, leftPaddingValue: 20,),
      ],
    );
  }
}

class HomeScreenRecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final double edgeTop;

  const HomeScreenRecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    required this.edgeTop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) Row(
          children: [
            TitlePadding(title: title),
            Expanded(child: Container()),
            Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Image.asset(AppMedia.ai_icon, width: 28, height: 28,))
          ],
        ),
        ImagePadding(
            imagePath: imagePath,
            onTap: onTap,
            topPaddingValue: edgeTop,
        ),
      ],
    );
  }
}