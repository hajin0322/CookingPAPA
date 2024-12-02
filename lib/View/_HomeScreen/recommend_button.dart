import 'dart:async';

import 'package:flutter/material.dart';
import 'package:group_project/View/ViewAsset/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/data_source_view_model.dart';

class RecommendButton extends StatelessWidget {
  const RecommendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        try {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return PopScope(
                  canPop: false,
                  child: AlertDialog(
                    titlePadding: const EdgeInsets.all(20),
                    title: Center(
                      child: Text(
                        "Wait a minute!",
                        style: AppStyles.headLineStyle2
                            .copyWith(color: AppStyles.textColor),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AppStyles.textColor),
                        const SizedBox(height: 20),
                        Text(
                          "PAPA is cooking recipes for you.",
                          style: AppStyles.textStyle,
                        ),
                        Text(
                          "DON'T TURN OFF THIS APP!",
                          style: AppStyles.textStyle
                              .copyWith(color: AppStyles.textColor),
                        )
                      ],
                    ),
                  ),
                );
              });

          final recipe = await Future.any([
            context
                .read<DataSourceViewModel>()
                .generateRecipeFromUsedIngredients(),
            Future.delayed(const Duration(minutes: 3), () {
              throw TimeoutException(
                  "Recipe generation timed out after 3 minutes.");
            }),
          ]);
          Navigator.pop(context);

          if (recipe == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('No recipes recommended! Please use it in a minute.'),
              ),
            );
          }
        } catch (e) {
          // 타임아웃 예외 처리
          Navigator.pop(context); // 로딩창 닫기
          print('Failed to generate recipes: $e');
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to generate recipes: $e')));
        }
      },
      backgroundColor: AppStyles.bgColor,
      label: Text("Recommend",
          style: AppStyles.headLineStyle3.copyWith(color: AppStyles.textColor)),
      icon: Icon(
        Icons.thumb_up,
        color: AppStyles.textColor,
      ),
    );
  }
}
