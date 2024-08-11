part of 'recent_transaction_bloc.dart';

@immutable
sealed class RecentTransactionEvent {}

class GetRecentTransactions extends RecentTransactionEvent {}

class DeleteTransaction extends RecentTransactionEvent {
  final String id;

  DeleteTransaction(this.id);
}

class EditTransaction extends RecentTransactionEvent {
  final Expense expene;

  EditTransaction(this.expene);
}
