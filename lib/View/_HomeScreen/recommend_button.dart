import 'package:flutter/material.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';

class RecommendButton extends StatelessWidget {
  const RecommendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppStyles.bgColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.recommend, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            "Recommend",
            style: AppStyles.headLineStyle3.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
