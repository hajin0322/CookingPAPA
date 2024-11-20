import 'package:flutter/material.dart';

import '../ViewAsset/styles/app_styles.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  const SettingsSection({
    required this.title,
    required this.onTap,
    super.key,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      height: 80,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppStyles.layoutColor),
            child: Center(
                child: Text(
              title,
              style: textStyle ?? AppStyles.headLineStyle3,
              textAlign: TextAlign.center,
            ))),
      ),
    );
  }
}
