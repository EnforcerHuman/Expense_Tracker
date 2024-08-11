import 'package:hive/hive.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/category_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/category.dart';

class CategoryRepository {
  // Box name for storing category data
  final String _categoryBoxName = 'categoryBox';

  /// Initializes the Hive box for categories.
  Future<void> initialize() async {
    await Hive.openBox<CategoryModel>(_categoryBoxName);
  }

  /// Adds a new category to the Hive box.
  ///
  /// [category] The category to be added.
  Future<void> addCategory(CategoryModel category) async {
    await Hive.openBox<CategoryModel>(_categoryBoxName);
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    await box.put(category.id, category);
  }

  /// Deletes a category from the Hive box.
  ///
  /// [id] The ID of the category to be deleted.
  Future<void> deleteCategory(String id) async {
    await Hive.openBox<CategoryModel>(_categoryBoxName);
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    await box.delete(id);
  }

  /// Retrieves all categories from the Hive box.
  ///
  /// Returns a list of [Category] objects.
  Future<List<Category>> getCategories() async {
    await Hive.openBox<CategoryModel>(_categoryBoxName);
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    final categoryModels = box.values.toList();

    // Convert CategoryModel instances to Category entities
    final categories = categoryModels.map((categoryModel) {
      return Category(
        id: categoryModel.id, // Assumes id exists in CategoryModel
        name: categoryModel.name,
        type: categoryModel.type, // Assumes type exists in CategoryModel
      );
    }).toList();

    return categories;
  }
}
