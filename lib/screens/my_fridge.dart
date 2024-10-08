import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Costom,
      body: const MyFridgeBody(),
      );
  }

  // PreferredSizeWidget _buildAppBar() {
  //   return AppBar(
  //     backgroundColor: AppStyles.bgColor,
  //     elevation: 0,
  //     centerTitle: true,
  //     toolbarHeight: 100,
  //     title: Padding(
  //       padding: const EdgeInsets.only(top: 15), // 여백 추가
  //       child: Text(
  //         "My Fridge",
  //         style: AppStyles.headLineStyle1,
  //       ),
  //     ),
  //   );
  // }
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
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Recently viewed 5 Recipes',
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
            child: Image.asset(
              'assets/CookingPAPA/doenJang_ggiGae.jpg',
              width: 400, // 원하는 너비
              height: 300, // 원하는 높이
              fit: BoxFit.cover, // 이미지 맞춤 방식
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Saved Recipes',
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
            child: Image.asset(
              'assets/CookingPAPA/kimchiggigae.jpg',
              width: 400, // 원하는 너비
              height: 300, // 원하는 높이
              fit: BoxFit.cover, // 이미지 맞춤 방식
            ),
          ),
        ),
      ],
    );
  }
}