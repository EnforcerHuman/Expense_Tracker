import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/category_repository.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/category.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepository categoryRepository;
  CategoriesBloc(this.categoryRepository) : super(CategoriesInitial()) {
    on<GetCategories>((event, emit) async {
      try {
        final categories = await categoryRepository.getCategories();
        if (categories.isEmpty) {
          emit(CategoriesEmpty('NO CATEGORIES ADDED'));
        } else {
          emit(CategoriesLoaded(categories));
        }
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });

    on<DeleteCategory>((event, emit) async {
      try {
        categoryRepository.deleteCategory(event.id);
        final categories = await categoryRepository.getCategories();
        if (categories.isEmpty) {
          emit(CategoriesEmpty('NO CATEGORIES ADDED'));
        } else {
          emit(CategoriesLoaded(categories));
        }
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
