import 'package:flutter/cupertino.dart';
import 'package:group_project/base/res/styles/app_styles.dart';


class AIText extends StatefulWidget {
  final String givenText;

  const AIText({super.key, required this.givenText});

  @override
  State<AIText> createState() => _AITextState();
}

class _AITextState extends State<AIText> {
  String get givenText => "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 40,
        right: 40,
      ),
      child: SizedBox(
              height: 350,
              child: givenText.isNotEmpty
                  ? Text(givenText): Text("Hello World! I'm Cooking PAPA! I want to make recipe for you! Come On BBOY", style: AppStyles.aiTextStyle),
            ),
    );
  }
}
