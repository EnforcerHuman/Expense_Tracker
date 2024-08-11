import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/expense_use_case.dart';

part 'recent_transaction_event.dart';
part 'recent_transaction_state.dart';

class RecentTransactionBloc
    extends Bloc<RecentTransactionEvent, RecentTransactionState> {
  final ExpenseUseCases expenseUseCases;
  RecentTransactionBloc(this.expenseUseCases)
      : super(RecentTransactionInitial()) {
    on<GetRecentTransactions>((event, emit) async {
      try {
        final test = await expenseUseCases.getAllExpenses();
        emit(RecentTransactionsLoaded(test));
      } catch (e) {
        emit(RecentTransactionError());
      }
    });
    on<DeleteTransaction>((event, emit) {
      expenseUseCases.deleteExpense(event.id);
    });
    on<EditTransaction>((event, emit) async {
//
      try {
        expenseUseCases.updateExpense(event.expene);
        final expenses = await expenseUseCases.getAllExpenses();
        emit(RecentTransactionsLoaded(expenses));
      } catch (e) {
        emit(RecentTransactionError());
      }
    });
  }
}
