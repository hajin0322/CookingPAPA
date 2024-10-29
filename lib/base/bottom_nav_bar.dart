import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_project/base/res/styles/app_styles.dart';
import 'package:group_project/screens/my_fridge.dart';
import 'package:group_project/screens/settings.dart';
import 'package:group_project/screens/recipe_search.dart';

import '../screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: const [
        HomeScreen(),
        RecipeSearch(),
        MyFridge(), //my_fridge 말고 변한곳 유일하게..
        Settings(),
      ]),
      bottomNavigationBar: Material(
        color: Colors.white54,
        child: TabBar(
          controller: _tabController,
          labelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600) ,
          labelColor: Colors.red,

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
