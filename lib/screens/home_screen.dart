import 'package:flutter/material.dart';
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
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppStyles.layoutColor),
                    child: const Text("Recommended for you"),
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
                    child: const Text("Today's recipe"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
