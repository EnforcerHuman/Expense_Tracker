import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense_overview.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/expense_use_case.dart';

part 'expense_over_view_event.dart';
part 'expense_over_view_state.dart';

class ExpenseOverViewBloc
    extends Bloc<ExpenseOverViewEvent, ExpenseOverViewState> {
  final ExpenseUseCases expenseUseCase;
  ExpenseOverViewBloc(this.expenseUseCase) : super(ExpenseOverViewInitial()) {
    on<ExpenseOverviewRequested>((event, emit) async {
      //

      try {
        double dailyExpense = await expenseUseCase.expenseForCurrentDay();
        double currentWeekExpense =
            await expenseUseCase.totalExpenseForCurrentWeek();
        final currentMonthExpense =
            await expenseUseCase.totalExpenseForCurrentMonth();
        ExpenseOverview expenseOverview = ExpenseOverview(
            dailyExpense: dailyExpense,
            weeklyExpense: currentWeekExpense,
            monthlyExpense: currentMonthExpense);
        emit(ExpenseDataLoaded(expenseOverview));
      } catch (e) {
        emit(ExpenseOverViewInitial());
      }
    });
  }
}
