import 'package:fluentui_icons/fluentui_icons.dart';
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
                // IMAGE
                Image.asset(AppMedia.photo)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
