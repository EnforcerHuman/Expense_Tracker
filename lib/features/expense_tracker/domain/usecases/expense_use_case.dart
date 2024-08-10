import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

class ExpenseUseCases {
  final HiveLocalDataResource repository;

  ExpenseUseCases(this.repository);

  /// Retrieves all expenses from the repository.
  Future<List<Expense>> getAllExpenses() async {
    return await repository.getAllExpenses();
  }

  /// Retrieves expenses filtered by a specific category.
  Future<List<Expense>> getExpensesByCategory(String category) async {
    final allExpenses = await repository.getAllExpenses();
    return allExpenses
        .where((expense) => expense.category == category)
        .toList();
  }
}
