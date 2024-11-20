import 'package:flutter/material.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';

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
        padding: EdgeInsets.only(left: (titleLeftPadding - 17.0)),
        child: Text(title, style: AppStyles.headLineStyle2),
      ),
      backgroundColor: AppStyles.bgColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Image.asset(
            logoAssetPath,
            height: logoSize, // 동적 로고 크기 적용
            width: logoSize, // 동적 로고 크기 적용
            fit: BoxFit.contain, // 이미지가 지정된 크기에 맞게 조정되도록 함
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
