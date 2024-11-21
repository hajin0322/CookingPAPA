import 'package:flutter/material.dart';
import '../ViewAsset/styles/app_styles.dart';

class SearchCategories extends StatefulWidget {
  final List<Category> categories;
  final Function(List<String>) onSelectionChanged;

  const SearchCategories({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
  });

  @override
  State<SearchCategories> createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  List<String> selectedTexts = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              return _buildTile(widget.categories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTile(Category category) {
    if (category.subCategories.isEmpty) {
      return CheckboxListTile(
        title: Text(
          category.name,
          style: AppStyles.textStyle,
        ),
        value: category.isChecked,
        onChanged: (bool? value) {
          setState(() {
            category.isChecked = value ?? false;
            if (category.isChecked) {
              selectedTexts.add(category.name);
            } else {
              selectedTexts.remove(category.name);
            }
            widget.onSelectionChanged(selectedTexts);
          });
        },
      );
    }

    return ExpansionTile(
      title: Text(
        category.name,
        style: AppStyles.textStyle,
      ),
      children: category.subCategories.map(_buildTile).toList(),
    );
  }
}

class Category {
  final String name;
  final List<Category> subCategories;
  bool isChecked;

  Category({
    required this.name,
    this.subCategories = const [],
    this.isChecked = false,
  });
}
