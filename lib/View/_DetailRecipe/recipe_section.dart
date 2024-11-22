import 'package:flutter/material.dart';
import '../ViewAsset/styles/app_styles.dart';

class TitlePadding extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const TitlePadding({
    super.key,
    required this.title,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
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
  final double imageWidth;

  const ImagePadding(
      {super.key,
      required this.imagePath,
      required this.onTap,
      this.imageWidth = 400});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
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

class RecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final String ico;
  final String? additionalInfo; // 추가 정보

  const RecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    required this.ico,
    this.additionalInfo, // 추가 정보 입력 가능
  });

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600 &&
        aspectRatio < 1.6; // 테블릿 기준 너비 설정
    print(isTablet);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Row(
            children: [
              TitlePadding(title: title),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Image.asset(
                  ico,
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지
            Expanded(
              flex: isTablet ? 2 : 1, // 테블릿에서 이미지를 더 적게 차지
              child: ImagePadding(
                imagePath: imagePath,
                onTap: onTap,
              ),
            ),
            if (isTablet && additionalInfo != null) // 테블릿에서만 추가 텍스트 표시
              Expanded(
                flex: 1, // 나머지 공간 활용
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    additionalInfo!,
                    style: AppStyles.headLineStyle3,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
