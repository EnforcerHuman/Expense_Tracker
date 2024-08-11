part of 'expense_category_analysis_bloc.dart';

@immutable
sealed class ExpenseCategoryAnalysisEvent {}

class GetExpensesByCategory extends ExpenseCategoryAnalysisEvent {}
