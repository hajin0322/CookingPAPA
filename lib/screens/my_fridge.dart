import 'package:flutter/material.dart';
import 'package:group_project/base/res/media.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import 'package:group_project/base/widgets/horizontal_scroll_widget_for_recently_viewed.dart';
import 'package:group_project/base/widgets/simple_navigation_widget.dart';
import 'package:group_project/screens/saved_recipe.dart';
import '../base/widgets/app_bar.dart';
import '../base/widgets/recipe_section.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "My Fridge"),
      body: const MyFridgeBody(),
      backgroundColor: AppStyles.bgColor,
    );
  }
}

class MyFridgeBody extends StatefulWidget {
  const MyFridgeBody({super.key});

  @override
  State<StatefulWidget> createState() => _MyFridgeBodyState();
}

class _MyFridgeBodyState extends State<MyFridgeBody> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleNavigationBar(
          title: 'Saved Recipes',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SavedRecipe(),
              ), // 최근 5개 페이지로 이동하는 로직
            );
          },
          topPaddingValue: 50,
        ),
        const RecViewWidget(),
      ],
    );
  }
}
