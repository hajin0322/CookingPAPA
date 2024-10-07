import 'package:flutter/material.dart';
import '../base/res/styles/app_styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool resetCheckBox = false;

  void _showResetPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Center(child: Text("Are you sure?")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Text(
                      "All stored data will be gone.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 강조된 문구 추가
                  const Center(
                    child: Text.rich(
                      TextSpan(
                        text: '*', // 별표 추가
                        children: <TextSpan>[
                          TextSpan(
                            text: ' This action is not reversible ',
                            style: TextStyle(
                              color: Colors.red, // 빨간색 강조
                              fontWeight: FontWeight.bold, // 굵게
                            ),
                          ),
                          TextSpan(text: '*'), // 별표 추가
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: resetCheckBox,
                        onChanged: (bool? value) {
                          setState(() {
                            resetCheckBox = value ?? false;
                          });
                        },
                      ),
                      const Text("Yes I understand")
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: resetCheckBox
                        ? () {
                            // 기능 추가 예정
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: resetCheckBox
                          ? AppStyles.primaryColor
                          : Colors.grey.withOpacity(0.5), // 비활성화 시 반투명색
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15), // 버튼 크기
                    ),
                    child: const Text("Proceed"),
                  )
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      resetCheckBox = false; // 팝업 닫을 때 체크박스 초기화
                    });
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  alignment: Alignment.topRight,
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // 팝업이 닫힐 때 체크박스 상태를 기본으로 되돌림
      setState(() {
        resetCheckBox = false;
      });
    });
  }

  void _showAppInfoPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("App Info"),
          content: const Text("This is the app version and information."),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
              alignment: Alignment.topRight,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
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
                              "Settings",
                              style: AppStyles.headLineStyle1,
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                        const SizedBox(height: 10),
                        // Reset Fridge Widget
                        SizedBox(
                          height: 70,
                          width: size.width * 0.9,
                          child: GestureDetector(
                            onTap: _showResetPopup,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppStyles.layoutColor),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Reset Fridge"),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // App Info Widget
                        SizedBox(
                          height: 70,
                          width: size.width * 0.9,
                          child: GestureDetector(
                            onTap: _showAppInfoPopup,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppStyles.layoutColor),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("App Info"),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            // Version Information at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Version 0.0.1",
                  style: TextStyle(
                    color: Colors.grey[600], // Light gray color
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
