import 'package:flutter/cupertino.dart';

import '../res/styles/app_styles.dart';

class RecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const RecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 16),
          child: Text(
            title,
            style: AppStyles.headLineStyle2,
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 40, right: 70, top: 20, bottom: 30),
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: 300,
                height: 267,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
