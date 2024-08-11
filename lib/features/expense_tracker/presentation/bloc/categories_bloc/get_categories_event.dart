part of 'get_categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class GetCategories extends CategoriesEvent {}

class DeleteCategory extends CategoriesEvent {
  final String id;

  DeleteCategory(this.id);
}

class SelectCategory extends CategoriesEvent {
  final String category;

  SelectCategory(this.category);
}
