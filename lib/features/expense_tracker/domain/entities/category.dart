class Category {
  final String id;
  final String name;
  final String type; // e.g., "Income" or "Expense"
  // You can store a reference to an icon asset or icon name here

  Category({
    required this.id,
    required this.name,
    required this.type,
  });

  @override
  String toString() {
    return 'Category{id: $id, name: $name,  type: $type,}';
  }
}
