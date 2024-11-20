import 'package:flutter/material.dart';

import '../ViewAsset/styles/app_styles.dart';
import 'recipe_search_results.dart';

class SearchCategories extends StatefulWidget {
  final List<Category> categories;

  const SearchCategories({super.key, required this.categories});

  @override
  State<SearchCategories> createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  List<String> selectedTexts = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                return _buildTile(widget.categories[index]);
              },
            )
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
            width: size.width * 0.9,
            height: 200,
            child: Column(
            children: [
            Container(
            color: AppStyles.layoutColor,
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RecipeSearchResults(
                      result:
                      selectedTexts, //다음 화면의 result에  _selectedTexts를 전달
                    ),
                settings: RouteSettings(
                  arguments: selectedTexts,
                ),
              ),
            );
          },
          child: const Text("Cook Start"),
        ),
        Padding(padding: const EdgeInsets.all(8.0),
          child: Text('Selected Items: ${selectedTexts.join(', ')}', style: AppStyles.textStyle,),)
      ],
    ))]);
  }


  Widget _buildTile(Category category) {
    if (category.subCategories.isEmpty) {
      return CheckboxListTile(
        title: Text(category.name, style: AppStyles.textStyle,),
        value: category.isChecked,
        onChanged: (bool? value) {
          setState(() {
            category.isChecked = value ?? false;
            if (category.isChecked) {
              selectedTexts.add(category.name);
            }
            else {
              selectedTexts.remove(category.name);
            }
          });
        },
      );
    }

    return ExpansionTile(
      title: Text(category.name),
      children: category.subCategories.map(_buildTile).toList(),
    );
  }
}

class Category {
  final String name;
  final List<Category> subCategories;
  bool isChecked;

  Category({required this.name, this.subCategories = const [
  ], this.isChecked = false});
}
