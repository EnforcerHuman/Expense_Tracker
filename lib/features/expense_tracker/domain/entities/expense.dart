// lib/domain/entities/expense.dart

import 'package:moneymanagementapp/features/expense_tracker/data/model/expense_model.dart';

class Expense {
  final String id;
  final double amount;
  final DateTime date;
  final String description;
  final String category;

  Expense({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.category,
  });

  // Factory constructor to create Expense from ExpenseModel
  factory Expense.fromModel(ExpenseModel model) {
    return Expense(
      id: model.id,
      amount: model.amount,
      date: model.date,
      description: model.description,
      category: model.category,
    );
  }
}
