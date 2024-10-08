import 'package:flutter/material.dart';
import '../res/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final double titleLeftPadding;
  final String logoAssetPath;
  final double logoSize; // 로고 크기를 위한 새 속성

  const CustomAppBar({
    super.key,
    required this.title,
    this.height = 100,
    this.titleLeftPadding = 16.0,
    this.logoAssetPath = 'assets/CookingPAPA/let him cook2.png',
    this.logoSize = 100, // 기본 로고 크기를 60으로 설정
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      title: Padding(
        padding: EdgeInsets.only(left: titleLeftPadding),
        child: Text(title, style: AppStyles.headLineStyle2),
      ),
      backgroundColor: AppStyles.bgColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset(
            logoAssetPath,
            height: logoSize, // 동적 로고 크기 적용
            width: logoSize,  // 동적 로고 크기 적용
            fit: BoxFit.contain, // 이미지가 지정된 크기에 맞게 조정되도록 함
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}