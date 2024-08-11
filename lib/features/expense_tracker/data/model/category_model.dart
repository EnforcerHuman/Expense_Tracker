import 'package:hive/hive.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/category.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String type;

  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
  });

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      type: type,
    );
  }

  // Factory constructor to create CategoryModel from Category (domain entity)
  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      type: category.type,
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name,  type: $type,}';
  }
}
