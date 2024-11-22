import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final double titleLeftPadding;
  final String logoAssetPath;
  final double logoSize;
  final bool showBackButton;

  const CustomAppBar(
      {
      // 커스텀 앱 바 생성자
      super.key,
      required this.title,
      this.height = 100,
      this.titleLeftPadding = 24,
      this.logoAssetPath = AppMedia.logo,
      this.logoSize = 60, // 기본 로고 크기를 60으로 설정
      this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(FluentSystemIcons.ic_fluent_arrow_left_filled))
          : null,
      title: Padding(
        padding: EdgeInsets.only(left: showBackButton? 0 : titleLeftPadding),
        child: Text(title, style: AppStyles.headLineStyle2),
      ),
      backgroundColor: AppStyles.bgColor,
      surfaceTintColor: AppStyles.layoutColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
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
