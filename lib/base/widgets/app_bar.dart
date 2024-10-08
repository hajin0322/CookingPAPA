import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final double height;
  final String title;

  const CustomAppBar({super.key, required this.title, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
        title: Text(title, style: AppStyles.headLineStyle1,),
        backgroundColor: AppStyles.bgColor,
        elevation: 0.0
    );

  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}
