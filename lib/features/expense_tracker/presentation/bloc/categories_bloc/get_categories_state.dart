part of 'get_categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String erroeMessage;

  CategoriesError(this.erroeMessage);
}

class CategoriesEmpty extends CategoriesState {
  final String message;

  CategoriesEmpty(this.message);
}

class CategorySelected extends CategoriesState {
  final String category;

  CategorySelected(this.category);
}
