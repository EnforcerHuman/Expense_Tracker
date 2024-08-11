part of 'expense_over_view_bloc.dart';

@immutable
sealed class ExpenseOverViewState {}

final class ExpenseOverViewInitial extends ExpenseOverViewState {}

class ExpenseDataLoaded extends ExpenseOverViewState {
  final ExpenseOverview expenseOverview;

  ExpenseDataLoaded(this.expenseOverview);
}
