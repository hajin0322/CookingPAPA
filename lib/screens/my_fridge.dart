import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';

class MyFridge extends StatefulWidget {
  const MyFridge({super.key});

  @override
  State<MyFridge> createState() => _RecipeStorageState();
}

class _RecipeStorageState extends State<MyFridge> {
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
                        "My Fridge",
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
                    height: 300,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                      child: const Text("Recently Viewed 5 Recipes"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 300,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                      child: const Text("Saved Recipes"),
                    ),
                  )
                ],
              ))
        ]));
  }
}
