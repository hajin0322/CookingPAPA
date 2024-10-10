import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import 'package:group_project/base/widgets/recipe_section.dart';

class SimpleNavigationBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double topPaddingValue;
  final double leftPaddingValue;
  final double rightPaddingValue;

  const SimpleNavigationBar({
    super.key,
    required this.title,
    required this.onTap,
    this.topPaddingValue = 0,           // 이 위젯의 top 패딩값 => 여기 설정에 따라서 다른 위젯과의 간격을 둘 수 있음. required 아니기 때문에 기본값이라 조정 가능.
    this.leftPaddingValue = 40,         // left 패딩값
    this.rightPaddingValue = 40,        // right 패딩값
  });

  @override
  Widget build(BuildContext context) {
    //제스처 디텍터 위젯으로 누르는 기능 구현
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        //심플 바의 위치 조정 위한.
        padding: EdgeInsets.only(left: leftPaddingValue, right: rightPaddingValue, top: topPaddingValue),

        //컨테이너로 만듦.
        child: Container(
          decoration: BoxDecoration(
            color: AppStyles.simpleBarColor, // simple bar background 설정
            borderRadius: BorderRadius.circular(15), // round 모서리
          ),

          //아이콘 넣고 싶어서 row로 감싸고 그 안에 titlepadding이랑 아이콘 넣음.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitlePadding(
                title: title,
                leftPaddingValue: 10, // 왼쪽 패딩 값 설정
              ), // TitlePadding을 자식으로 추가

              //simple 바의 아이콘. 오른쪽에서 살짝 띄우기 싶어서 패딩 사용
              const Padding(
                padding: EdgeInsets.only(right : 10),
                child: Icon(
                  Icons.arrow_forward, // 오른쪽 화살표 아이콘
                  color: Colors.black, // 아이콘 색상 설정
                ),
              ),
            ], // children
          ),
        ),
      ),
    );
  } //build widget
} // SimpleNavigationBar class

