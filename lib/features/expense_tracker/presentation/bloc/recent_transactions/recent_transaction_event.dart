part of 'recent_transaction_bloc.dart';

@immutable
sealed class RecentTransactionEvent {}

class GetRecentTransactions extends RecentTransactionEvent {}
