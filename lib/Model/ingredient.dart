class Ingredient {
  final String name;
  final String category;
  bool isSelected;

  Ingredient({
    required this.name,
    required this.category,
    this.isSelected = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Ingredient && 
           other.name == name && 
           other.category == category;
  }

  @override
  int get hashCode => name.hashCode ^ category.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      // 필요한 다른 필드들도 추가
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      category: json['category'],
      // 필요한 다른 필드들도 추가
    );
  }
}