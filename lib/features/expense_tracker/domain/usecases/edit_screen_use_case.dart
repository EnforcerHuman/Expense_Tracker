import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';

class UpdateExpenseUseCase {
  void onEditSubmitted(
      Expense expnse, String amount, String description, BuildContext context) {
    final expense = Expense(
        id: expnse.id,
        amount: double.parse(amount),
        date: expnse.date,
        description: description,
        category: expnse.category);
    context.read<RecentTransactionBloc>().add(EditTransaction(expense));
    context.read<ExpenseOverViewBloc>().add(ExpenseOverviewRequested());
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Transaction updated successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
