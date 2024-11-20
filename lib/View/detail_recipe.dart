import 'package:flutter/material.dart';
import 'ViewWidgets/widgets/app_bar.dart';

class DetailRecipe extends StatelessWidget {
  const DetailRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Recipe"),
      body: DetailRecipeBody(),
    );
  }
}

class DetailRecipeBody extends StatefulWidget {
  const DetailRecipeBody({super.key});

  @override
  State<StatefulWidget> createState() => _DetailRecipeBodyState();
}

class _DetailRecipeBodyState extends State<DetailRecipeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}