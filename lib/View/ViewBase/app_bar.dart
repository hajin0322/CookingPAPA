import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<IconButton> actions;

  const CustomAppBar(
      {
      // 커스텀 앱 바 생성자
      super.key,
      required this.title,
      this.showBackButton = false,
      this.actions = const [] });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(FluentSystemIcons.ic_fluent_arrow_left_filled))
          : null,
      title: Padding(
        padding: EdgeInsets.only(left: showBackButton ? 0 : 24),
        child: Text(title, style: AppStyles.headLineStyle2),
      ),
      backgroundColor: AppStyles.bgColor,
      surfaceTintColor: AppStyles.layoutColor,
      elevation: 0,
      centerTitle: false,
      actions: (actions.isEmpty)
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Image.asset(
                  AppMedia.logo,
                  height: 60, // 동적 로고 크기 적용
                  width: 60, // 동적 로고 크기 적용
                  fit: BoxFit.contain, // 이미지가 지정된 크기에 맞게 조정되도록 함
                ),
              ),
            ]
          : actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
