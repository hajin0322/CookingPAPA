import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';

import '../base/widgets/app_bar.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(stringText: "My Fridge"),
      body: MyFridgeState(),
    );
  }
}

class MyFridgeState extends StatefulWidget {
  const MyFridgeState({super.key});

  @override
  State<MyFridgeState> createState() => _RecipeStorageState();
}

class _RecipeStorageState extends State<MyFridgeState> {
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
