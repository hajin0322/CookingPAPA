import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';

import '../res/styles/app_styles.dart';

// 근형 내 이야기와 노고를 꼭 들어주길 바라 근형 우리 한번 성공해보자
// 자 내가 title이랑 image padding마다 클래스를 나눠 만들려고 해
// 왜 이런 귀찮은 일을 했냐??? 일단 우리 서로가 쓰는 이미지 크기랑 패딩 간격도 다르고
// 형 이제 가로 스크롤이랑 title_padding에 more 버튼을 만들 걸 생각하니
// 정신이 아득바득해지더라고 그래서 이걸 다 따로 구분하기로 했어
// 그래서 row, column, container 등으로 조합할 수 있게끔
// 이 요소들을 분리해서 class로 정리했어
// 내 맘 알지 형? 사랑해

class TitlePadding extends StatelessWidget {
  final String title;

  const TitlePadding({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 10),
      child: Text(
        title,
        style: AppStyles.headLineStyle2,
      ),
    );
  }
}

class ImagePadding extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double edgeTop;
  final double edgeRight;

  const ImagePadding(
      {super.key,
      required this.imagePath,
      required this.onTap,
      required this.edgeTop,
      required this.edgeRight});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(left: 40, right: edgeRight, top: edgeTop, bottom: 30),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            width: size.width,
            height: 300,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitlePadding(title: title),
        ImagePadding(
            imagePath: imagePath, onTap: onTap, edgeTop: 20, edgeRight: 70),
      ],
    );
  }
}

// 이건 내껑
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
            const Padding(
                padding: EdgeInsets.only(left: 40, top: 16, right: 40),
                child: Icon(FluentSystemIcons.ic_fluent_star_filled))
          ],
        ),
        ImagePadding(
            imagePath: imagePath,
            onTap: onTap,
            edgeTop: edgeTop,
            edgeRight: 40),
      ],
    );
  }
}

// 이거 오리지널 근짱 코드양
/*
class RecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const RecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 16),
          child: Text(
            title,
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 40, right: 70, top: 20, bottom: 30),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/
