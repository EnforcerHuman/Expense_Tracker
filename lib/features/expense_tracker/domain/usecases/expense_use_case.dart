import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

class ExpenseUseCases {
  final HiveLocalDataResource repository;

  ExpenseUseCases(this.repository);

  /// Retrieves all expenses from the repository.
  ///
  /// Returns a list of all Expense objects stored in the data source.
  Future<List<Expense>> getAllExpenses() async {
    return await repository.getAllExpenses();
  }

  /// Retrieves expenses filtered by a specific category.
  ///
  /// [category] The category to filter expenses by.
  /// Returns a list of Expense objects matching the specified category.
  Future<List<Expense>> getExpensesByCategory(String category) async {
    final allExpenses = await repository.getAllExpenses();
    return allExpenses
        .where((expense) => expense.category == category)
        .toList();
  }

  /// Calculates and prints the total expense across all recorded expenses.
  ///
  /// This function aggregates the amounts of all expenses and displays
  /// the total, formatted to two decimal places.
  Future<void> totalExpense() async {
    try {
      final expenses = await repository.getAllExpenses();

      expenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );
    } catch (e) {}
  }

  /// Calculates and prints the total expense for the previous month.
  ///
  /// This function filters expenses from the last month, sums their amounts,
  /// and displays the total formatted to two decimal places.
  Future<void> totalExpenseForLastMonth() async {
    try {
      final expenses = await repository.getAllExpenses();
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month - 1, 1);
      final endOfMonth = DateTime(now.year, now.month, 0);

      final lastMonthExpenses = expenses.where((expense) {
        return expense.date.isAfter(startOfMonth) &&
            expense.date.isBefore(endOfMonth);
      }).toList();

      lastMonthExpenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );
    } catch (e) {}
  }

  /// Calculates and prints the total expense for the previous week.
  ///
  /// This function identifies the last week's date range, filters relevant
  /// expenses, and displays their sum formatted to two decimal places.
  Future<void> totalExpenseForLastWeek() async {
    try {
      final expenses = await repository.getAllExpenses();
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday));
      final startOfLastWeek = startOfWeek.subtract(const Duration(days: 7));

      final lastWeekExpenses = expenses.where((expense) {
        return expense.date.isAfter(startOfLastWeek) &&
            expense.date.isBefore(startOfWeek);
      }).toList();

      lastWeekExpenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );
    } catch (e) {}
  }

  /// Calculates and prints the total expense for the current week.
  ///
  /// This function determines the current week's date range, filters
  /// applicable expenses, and displays their sum to two decimal places.
  Future<double> totalExpenseForCurrentWeek() async {
    try {
      final expenses = await repository.getAllExpenses();
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final endOfWeek = startOfWeek.add(const Duration(days: 7));

      final currentWeekExpenses = expenses.where((expense) {
        return expense.date.isAfter(startOfWeek) &&
            expense.date.isBefore(endOfWeek);
      }).toList();

      final totalExpense = currentWeekExpenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );

      return totalExpense;
    } catch (e) {
      return 0;
    }
  }

  /// Gets the total expenses for today.
  ///
  /// This function looks at all expenses and picks out those from today. It sums
  /// up the amounts and returns the total. If something goes wrong, it just returns 0.0.
  ///
  /// Returns:
  /// - A Future that gives the total expense for today.
  Future<double> expenseForCurrentDay() async {
    try {
      final expenses = await repository.getAllExpenses();

      final now = DateTime.now();

      final startOfDay = DateTime(now.year, now.month, now.day);

      final endOfDay = startOfDay.add(const Duration(days: 1));

      final currentDayExpenses = expenses.where((expense) {
        return expense.date.isAfter(startOfDay) &&
            expense.date.isBefore(endOfDay);
      }).toList();

      final totalExpense = currentDayExpenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );

      return totalExpense;
    } catch (e) {
      return 0.0;
    }
  }

  /// Calculates and prints the total expense for the current month.
  ///
  /// This function identifies the current month's date range, filters
  /// relevant expenses, and displays their sum to two decimal places.
  Future<double> totalExpenseForCurrentMonth() async {
    try {
      final expenses = await repository.getAllExpenses();
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month, 1);
      final endOfMonth = DateTime(now.year, now.month + 1, 1);

      final currentMonthExpenses = expenses.where((expense) {
        return expense.date
                .isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
            expense.date.isBefore(endOfMonth);
      }).toList();

      final totalExpense = currentMonthExpenses.fold<double>(
        0.0,
        (sum, expense) => sum + expense.amount,
      );

      return totalExpense;
    } catch (e) {
      return 0;
    }
  }

  /// Adds a new expense to the repository.
  ///
  /// [expense] The Expense object to be added.
  /// Returns a Future that completes when the operation is finished.
  Future<void> addExpense(Expense expense) async {
    await repository.addExpense(expense);
  }

  /// Updates an existing expense in the repository.
  ///
  /// [expense] The updated Expense object.
  /// Returns a Future that completes when the operation is finished.
  Future<void> updateExpense(Expense expense) async {
    await repository.updateExpense(expense);
  }

  /// Deletes an expense from the repository by its ID.
  ///
  /// [id] The ID of the expense to be deleted.
  /// Returns a Future that completes when the operation is finished.
  Future<void> deleteExpense(String id) async {
    await repository.deleteExpense(id);
  }

  /// Retrieves a single expense by its ID.
  ///
  /// [id] The ID of the expense to retrieve.
  /// Returns a Future that resolves to the Expense object if found, or null if not found.
  Future<Expense?> getExpenseById(String id) async {
    return await repository.getExpense(id);
  }
}
