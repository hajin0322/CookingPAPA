import 'package:flutter/material.dart';
import 'package:group_project/View/_Settings/app_info_popup.dart';
import 'package:group_project/View/_Settings/reset_popup.dart';

import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';
import '../ViewBase/app_bar.dart';
import 'settings_section.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Settings"),
      body: const SettingsState(),
      backgroundColor: AppStyles.bgColor,
    );
  }
}

class SettingsState extends StatefulWidget {
  const SettingsState({super.key});

  @override
  State<SettingsState> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsState> {
  void _showResetPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ResetPopup();
      },
    );
  }

  void _showAppInfoPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AppInfoPopup();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsSection(
              title: "Reset Fridge",
              onTap: _showResetPopup,
            ),
            SettingsSection(
              title: "App Info",
              onTap: _showAppInfoPopup,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  AppMedia.cover,
                  width: 280,
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}