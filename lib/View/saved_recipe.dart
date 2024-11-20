import 'package:flutter/material.dart';

import 'ViewWidgets/widgets/app_bar.dart';


class SavedRecipe extends StatelessWidget {
  const SavedRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Saved Recipes"),
      body: SavedRecipeBody(),
    );
  }
}

class SavedRecipeBody extends StatefulWidget {
  const SavedRecipeBody({super.key});

  @override
  State<StatefulWidget> createState() => _SavedRecipeBodyState();
}

class _SavedRecipeBodyState extends State<SavedRecipeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}