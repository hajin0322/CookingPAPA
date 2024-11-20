import 'package:flutter/material.dart';

import '../ViewAsset/styles/app_styles.dart';

class ResetPopup extends StatefulWidget {
  const ResetPopup({super.key});

  @override
  _ResetPopupState createState() => _ResetPopupState();
}

class _ResetPopupState extends State<ResetPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(child: Text("Are you sure?")),
      content: Text(
          "All stored data will be gone!\nThis actions is not reversible.",
          style: AppStyles.headLineStyle3.copyWith(color: AppStyles.textColor)),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                // RESET
              });
              Navigator.of(context).pop();
            },
            child: const Text("Proceed")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"))
      ],
    );
  }
}
