import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:group_project/DataSource/data_source_model.dart';
import 'package:group_project/Model/ingredient_list.dart';
import 'package:group_project/ViewModel/data_source_view_model.dart';
import 'package:provider/provider.dart';
import 'package:group_project/View/ViewBase/bottom_nav_bar.dart';
import 'package:group_project/ViewModel/recipe_list_view_model.dart';
import 'dart:io';

import 'Model/recipe.dart';
import 'Repository/fileIO.dart';
import 'ViewModel/ingredient_list_view_model.dart';

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

  // 초기 starred 리스트 로드 시도
  List<Recipe> initialStarred = [];
  try {
    initialStarred = await FileIO().loadStarredRecipes();
  } catch (e) {
    print("Failed to load starred recipes: $e");
    // 실패해도 빈 리스트로 계속 진행
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeListViewModel(initialStarred)), // 수정된 부분
        ChangeNotifierProvider(create: (_) => DataSourceViewModel(DataSource(), IngredientListViewModel(IngredientList())))
      ],
      child: const MyApp(),
    ),
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