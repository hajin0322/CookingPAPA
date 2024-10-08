import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import '../base/widgets/app_bar.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "My fridge"),
      body: MyFridgeBody(),
      );
  }
}

class MyFridgeBody extends StatefulWidget {
  const MyFridgeBody({super.key});

  @override
  State<StatefulWidget> createState() => _MyFridgeBodyState();
}

class _MyFridgeBodyState extends State<MyFridgeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 16),
          child: Text(
            'Recently viewed 5 Recipes',
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 70, top: 20, bottom: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
            child: Image.asset(
              'assets/CookingPAPA/doenJang_ggiGae.jpg', //이미지를 누르면 최근 5개 페이지로 이동
              width: 300, // 원하는 너비
              height: 267, // 원하는 높이
              fit: BoxFit.cover, // 이미지 맞춤 방식
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 16),
          child: Text(
            'Saved Recipes',
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 70, top: 20, bottom: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
            child: Image.asset(
              'assets/CookingPAPA/kimchiggigae.jpg',  //이미지를 누르면 레시피 저장 페이지로 이동
              width: 300, // 원하는 너비
              height: 267, // 원하는 높이
              fit: BoxFit.cover, // 이미지 맞춤 방식
            ),
          ),
        ),
      ],
    );
  }
}