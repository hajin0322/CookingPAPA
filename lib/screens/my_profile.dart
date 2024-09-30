import 'package:flutter/material.dart';

import '../base/res/styles/app_styles.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                        "MyProfile",
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
                  const SizedBox(height: 10),
                  // RECIPE Widget
                  SizedBox(
                    height: 200,
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
                    height: 200,
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
                    height: 200,
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyles.layoutColor),
                    ),
                  )
                ],
              ))
        ]));
  }
}
