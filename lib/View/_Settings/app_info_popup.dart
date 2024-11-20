import 'package:flutter/material.dart';

import '../ViewAsset/styles/app_styles.dart';

class AppInfoPopup extends StatelessWidget {
  const AppInfoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(child: Text("CookingPAPA v1.0")),
      content: Text(
        "SangjinKim, SeonkyoKim,\nSejinKim, GeunwooBae\n\nPowered by llama3",
        style: AppStyles.headLineStyle3,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"))
      ],
    );
  }
}
