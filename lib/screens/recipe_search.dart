import 'package:flutter/material.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import 'package:group_project/base/widgets/search_categories.dart';

import '../base/res/styles/app_styles.dart';

class RecipeSearch extends StatelessWidget {
  const RecipeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Recipe Search"),
      body: const RecipeSearchState(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('새 레시피 추가');
        },
        backgroundColor: AppStyles.bgColor,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class RecipeSearchState extends StatefulWidget {
  const RecipeSearchState({super.key});

  @override
  State<RecipeSearchState> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearchState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: SearchCategories(categories: [
          Category(name: "Seafoods(해산물)", subCategories: [
            Category(name: "Fish(어류)",
                subCategories: [
                  Category(name: "Mackerel(고등어)"),
                  Category(name: "Corvina(조기)"),
          ]),
            Category(name: "Shellfish(갑각류)",
                subCategories: [
                  Category(name: "Blue crab(꽃게)"),
                  Category(name: "Shrimph(새우)"),
                ])
        ]),
      Category(name: "Livestocks(축산물)", subCategories: [
        Category(name: "Pork(돼지고기)",
            subCategories: [
              Category(name: "Pork belly(삽겹살)"),
              Category(name: "Pork shoulder(목살)"),
            ]),
        Category(name: "Beef(소고기)",
            subCategories: [
              Category(name: "Sirloin(등심)"),
              Category(name: "Tenderloin(안심)"),
            ])
      ]),
      Category(name: "Vegetables(채소류)", subCategories: [
        Category(name: "Raw Vegetables(생채소)",
            subCategories: [
              Category(name: "Onion(양파)"),
              Category(name: "Potato(감자)"),
            ]),
        Category(name: "Kimchis(김치류)",
            subCategories: [
              Category(name: "Cabbage kimchi(배추김치)"),
              Category(name: "Kkakdugi(깍두기)"),
            ])
      ])]));
  }
}
