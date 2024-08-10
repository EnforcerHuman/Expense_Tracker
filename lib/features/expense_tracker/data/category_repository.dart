import 'package:hive/hive.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/category_model.dart';

class CategoryRepository {
  final String _categoryBoxName = 'categoryBox';

  Future<void> initialize() async {
    await Hive.openBox<CategoryModel>(_categoryBoxName);
  }

  Future<void> addCategory(CategoryModel category) async {
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    await box.put(category.id, category);
  }

  Future<void> deleteCategory(String id) async {
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    await box.delete(id);
  }

  Future<List<CategoryModel>> getCategories() async {
    final box = Hive.box<CategoryModel>(_categoryBoxName);
    final categoryModels = box.values.toList();
    return categoryModels;
  }
}
