import 'package:flutter/material.dart'; //
import 'package:group_project/base/bottom_nav_bar.dart';

// main() 메소드
void main() {
  runApp(const MyApp()); // 애플리케이션 진입점 MyApp 위젯 루트 실행
}

// MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // MyApp 클래스 생성자

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(), // 애플리케이션 처음 실행 시 처음 표시할 위젯
    );
  }
}