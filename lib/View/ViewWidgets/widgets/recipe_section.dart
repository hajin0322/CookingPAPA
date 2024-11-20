import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';

import '../../ViewAsset/media.dart';
import '../../ViewAsset/styles/app_styles.dart';

class TitlePadding extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const TitlePadding({
    super.key,
    required this.title,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
      child: Text(
        title,
        style: textStyle ?? AppStyles.headLineStyle2,
      ),
    );
  }
}

class ImagePadding extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double imageWidth;

  const ImagePadding(
      {super.key,
      required this.imagePath,
      required this.onTap,
      this.imageWidth = 400});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            width: imageWidth,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
//
// // 이거 근형꺼
// class MyFridgeRecipeSection extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final VoidCallback onTap;
//
//   const MyFridgeRecipeSection({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TitlePadding(title: title, leftPaddingValue: 20,),
//         ImagePadding(
//             imagePath: imagePath, onTap: onTap, imageWidth: size.width * 0.7, topPaddingValue: 20, rightPaddingValue: 20, leftPaddingValue: 20,),
//       ],
//     );
//   }
// }

class RecipeSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  //final Icon icon;

  const MyFridgeRecipeSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Row(
            children: [
              TitlePadding(title: title),
              Expanded(child: Container()),
              Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Image.asset(
                    AppMedia.ai_icon,
                    width: 28,
                    height: 28,
                  ))
            ],
          ),
        ImagePadding(
          imagePath: imagePath,
          onTap: onTap,
        ),
      ],
    );
  }
}