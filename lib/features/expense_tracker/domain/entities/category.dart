class Category {
  final String id;
  final String name;
  final String description;
  final String type; // e.g., "Income" or "Expense"
  final String
      icon; // You can store a reference to an icon asset or icon name here

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.icon,
  });

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description, type: $type, icon: $icon}';
  }
}
