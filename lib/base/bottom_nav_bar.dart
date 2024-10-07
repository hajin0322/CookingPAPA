import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_project/screens/my_fridge.dart';
import 'package:group_project/screens/settings.dart';
import 'package:group_project/screens/recipe_search.dart';

import '../screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final appScreens = <Widget>[
    const HomeScreen(),
    const RecipeSearch(),
    const MyFridge(),
    const Settings(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      //update ui.
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526400),
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                label: "RecipeSearch"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_folder_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_folder_filled),
                label: "RecipeStorage"),
            BottomNavigationBarItem(
                icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
                label: "MyFridge"),
          ]),
    );
  }
}
