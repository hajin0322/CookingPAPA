import 'package:flutter/material.dart';

import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../_DetailRecipe/detail_recipe.dart';

class RecipeSearchResults extends StatefulWidget {
  const RecipeSearchResults(
      {super.key, required this.result}); //이전 화면에서 result라는 String을 받아와야함

  final List<String> result;

  @override
  State<RecipeSearchResults> createState() => _RecipeSearchResultsState();
}

class _RecipeSearchResultsState extends State<RecipeSearchResults> {
  late List<String> _result; //나중에 String을 정의해줌

  @override
  void initState() {
    super.initState();
    _result =
        widget.result; //이전화면에서 result라는 String을 받아와서 _result라는 String에 넣는다.
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String result = _result.join(', ');
    return Scaffold(
        body: ListView(children: [
          const SizedBox(height: 40),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Result for : ", style: AppStyles.headLineStyle3),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: size.width * 0.9,
                          child: Flexible(
                            child: Text(result, style: AppStyles.headLineStyle3),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ])),
          const SizedBox(height: 40),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: size.width * 0.9,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppStyles.layoutColor),
              child: Row(
                children: [
                  Image.asset(AppMedia.recipe1),
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kimchi Soup(김치찌개)",
                        style: AppStyles.headLineStyle2,
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailRecipe(),
                              ),
                            );
                          },
                          child: const Text("Let's Cook!"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 100,
            width: size.width * 0.9,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppStyles.layoutColor),
              child: Row(children: [
                Image.asset(AppMedia.recipe2),
                SizedBox(
                  width: size.width * 0.07,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tofu Kimchi(두부김치)",
                      style: AppStyles.headLineStyle2,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailRecipe(),
                            ),
                          );
                        },
                        child: const Text("Let's Cook!"),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          )
        ]));
  }
}