import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewBase/bottom_nav_bar.dart';
import 'package:group_project/ViewModel/recipe_view_model.dart';
import 'dart:io';

void debugEnvPath() {
  final currentDir = Directory.current.path;
  print('Current Directory: $currentDir');
  print('Files in directory: ${Directory(currentDir).listSync()}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: "assets/.env"); // .env 파일 로드
  } catch (e) {
    print("Failed to load .env file: $e");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeListViewModel()), // RecipeListViewModel 추가
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(), // 기존 구조 유지
    );
  }
}
