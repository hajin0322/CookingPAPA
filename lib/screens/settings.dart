import 'package:flutter/material.dart';

import '../base/res/media.dart';
import '../base/res/styles/app_styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                        "Settings",
                        style: AppStyles.headLineStyle1,
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 70,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                      child: const Text("Reset Fridge"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 70,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                      child: const Text("Dark Mode"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 70,
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
                    height: 70,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  ),
                  // IMAGE
                  Image.asset(AppMedia.photo)
                ],
              ))
        ]));
  }
}
