import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

part 'recent_transaction_event.dart';
part 'recent_transaction_state.dart';

class RecentTransactionBloc
    extends Bloc<RecentTransactionEvent, RecentTransactionState> {
  final HiveLocalDataResource localDataResource;
  RecentTransactionBloc(this.localDataResource)
      : super(RecentTransactionInitial()) {
    on<RecentTransactionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetRecentTransactions>((event, emit) async {
      try {
        final test = await localDataResource.getAllExpenses();
        emit(RecentTransactionsLoaded(test));
      } catch (e) {
        print(e.toString());
        emit(RecentTransactionError());
      }
    });
  }
}
