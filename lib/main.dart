import 'package:flutter/material.dart'; //
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_project/View/ViewBase/bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: "assets/.env"); // .env를 assets 디렉토리에 배치
  } catch (e) {
    print("Failed to load .env file: $e");
  }
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