import 'package:flutter/material.dart';
import 'package:group_project/base/res/media.dart';
import 'package:group_project/base/widgets/app_bar.dart';
import '../base/res/styles/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(stringText: "What are you Cooking Today?"),
      body: HomeScreenState(),
    );
  }
}

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  State<HomeScreenState> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenState> {
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
