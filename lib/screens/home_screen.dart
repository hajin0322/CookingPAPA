import 'package:flutter/material.dart';
import 'package:group_project/base/res/media.dart';
import '../base/res/styles/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // AppBar Widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CookingPAPA", style: AppStyles.headLineStyle3),
                        const SizedBox(height: 5),
                        Text("What are you Cooking Today?",
                            style: AppStyles.headLineStyle1)
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      color: Colors.blueGrey,
                      size: 35,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // RECIPE Widget
                SizedBox(
                  height: 300,
                  width: size.width * 0.9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppStyles.layoutColor),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recommended for you",
                                style: AppStyles.headLineStyle3),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  "more",
                                  style: AppStyles.textStyle
                                      .copyWith(color: Colors.blueGrey),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width * 0.9,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(AppMedia.food1))),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // RECIPE Widget
                SizedBox(
                    height: 300,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyles.layoutColor),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Today's recipe",
                                style: AppStyles.headLineStyle3),
                            InkWell(
                                onTap: () {},
                                child: Text(
                                  "more",
                                  style: AppStyles.textStyle
                                      .copyWith(color: Colors.blueGrey),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width * 0.9,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(AppMedia.food2))),
                        ),
                      ]),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
