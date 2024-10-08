import 'package:flutter/material.dart';
import 'package:group_project/base/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}


// ********* my_fridge 말고 유일하게 변한곳 -> bottom nav bar의 bottomNavBarState!!! 표시해뒀음.