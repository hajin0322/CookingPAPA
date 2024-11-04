import 'package:flutter/material.dart';
import '../res/media.dart';
import '../res/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final double titleLeftPadding;
  final String logoAssetPath;
  final double logoSize;

  const CustomAppBar({
    // 커스텀 앱 바 생성자
    super.key,
    required this.title,
    this.height = 100,
    this.titleLeftPadding = 40.0,
    this.logoAssetPath = AppMedia.logo,
    this.logoSize = 100, // 기본 로고 크기를 60으로 설정
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      title: Padding(
        padding: EdgeInsets.only(left: (titleLeftPadding - 17.0)), // 왜 - 10하냐? => 플러터 디자인에서 기본으로 앱바 시작이 왼쪽에서 10픽셀 떨어지게 만듦. 그래서 - 10해둔것.
        child: Text(title, style: AppStyles.headLineStyle2),
      ),
      backgroundColor: AppStyles.bgColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0), // 똑같은 이유로 플러터 디자인에서 오른쪽 gap으로 36 적용그래서 40으로 통일시키고자 4만 적음.
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