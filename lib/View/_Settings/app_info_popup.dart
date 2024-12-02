import 'package:flutter/material.dart';

import '../ViewAsset/media.dart';
import '../ViewAsset/styles/app_styles.dart';

class AppInfoPopup extends StatelessWidget {
  const AppInfoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppStyles.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(child: Text("CookingPAPA v1.0", )),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppMedia.logoCAS,
              width: 280,
              height: 240,
              fit: BoxFit.contain,
            ),
            Text(
              "Team INITIATE\nsponsored by CAS\n",
              style: AppStyles.headLineStyle2,
              textAlign: TextAlign.center,
            ),
            Text(
              "SangjinKim, SeonkyoKim,\nSejinKim, GeunwooBae\n",
              style: AppStyles.headLineStyle3,
              textAlign: TextAlign.center,
            ),
            Text(
              "Powered by\nLlama3\nHugging Face\nStable Diffusion",
              style: AppStyles.headLineStyle3,
              textAlign: TextAlign.center,
            )
          ],
        ),
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
