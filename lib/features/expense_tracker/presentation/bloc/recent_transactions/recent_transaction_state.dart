part of 'recent_transaction_bloc.dart';

@immutable
sealed class RecentTransactionState {}

final class RecentTransactionInitial extends RecentTransactionState {}

class RecentTransactionsLoaded extends RecentTransactionState {
  final List<Expense> recentTransactions;

  RecentTransactionsLoaded(this.recentTransactions);
}

class RecentTransactionError extends RecentTransactionState {}
