import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../ViewAsset/styles/app_styles.dart';
import '../_HomeScreen/home_screen.dart';
import '../_MyFridge/my_fridge.dart';
import '../_RecipeSearch/recipe_search.dart';
import '../_Settings/settings.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {

  late TabController
      _tabController;

  // TabController 초기화
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  // TabController 자원 해제
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // build 위젯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: const [
        // TabBarView 위젯(컨트롤러, 칠드런): 각 탭에 대한 컨텐츠 표시
        HomeScreen(), // 홈 화면 위젯
        RecipeSearch(), // 레시피 검색 화면 위젯
        MyFridge(), // 냉장고 화면 위젯
        Settings(), // 설정 화면 위젯
      ]),
      bottomNavigationBar: Material(
        // bottomNavigationBar 위젯: 내비바 인터페이스 디자인
        color: AppStyles.tabColor,
        child: TabBar(
          // TabBar 위젯: 탭 선택 인터페이스 디자인
          controller: _tabController,
          labelStyle:
              const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          labelColor: AppStyles.textColor,
          tabs: const [
            Tab(
              text: 'Home Screen',
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            ),
            Tab(
                text: 'Recipe Search',
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular)),
            Tab(
                text: 'My fridge',
                icon: Icon(FluentSystemIcons.ic_fluent_folder_regular)),
            Tab(
                text: 'Settings',
                icon: Icon(FluentSystemIcons.ic_fluent_settings_regular)),
          ],
        ),
      ),
    );
  }
}
