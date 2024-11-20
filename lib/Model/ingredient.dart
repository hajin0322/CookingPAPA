class Ingredient {
  final String name;
  final String category;
  bool isSelected;

  Ingredient({
    required this.name,
    required this.category,
    this.isSelected = false,
  });
}