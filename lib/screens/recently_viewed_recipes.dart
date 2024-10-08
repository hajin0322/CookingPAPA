import 'package:flutter/material.dart';

import '../base/widgets/app_bar.dart';

class RecentlyViewedRecipe extends StatelessWidget {
  const RecentlyViewedRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Recently viewed 5 Recipes"),
      body: RecentlyViewedRecipeBody(),
    );
  }
}

class RecentlyViewedRecipeBody extends StatefulWidget {
  const RecentlyViewedRecipeBody({super.key});

  @override
  State<StatefulWidget> createState() => _RecentlyViewedRecipeBodyState();
}

class _RecentlyViewedRecipeBodyState extends State<RecentlyViewedRecipeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}