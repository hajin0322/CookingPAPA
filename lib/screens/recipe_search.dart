import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../base/res/styles/app_styles.dart';

class RecipeSearch extends StatefulWidget {
  const RecipeSearch({super.key});

  @override
  State<RecipeSearch> createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: ListView(children: [
          const SizedBox(height: 40),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // AppBar Widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RecipeSearch",
                        style: AppStyles.headLineStyle1,
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.blueGrey,
                        size: 35,
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Search Widget
                  // Container(
                  //   height: 55,
                  //   width: size.width * 0.9,
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 12, vertical: 12),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: const Color(0xFFF4F6FD)),
                  //   child: const Row(
                  //     children: [
                  //       Icon(
                  //         FluentSystemIcons.ic_fluent_search_regular,
                  //         color: Color(0xFFBFC205),
                  //       ),
                  //       SizedBox(width: 10),
                  //       Expanded(
                  //         child: TextField(
                  //           decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: "search",
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 100,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
