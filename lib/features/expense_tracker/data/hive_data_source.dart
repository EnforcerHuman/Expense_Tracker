import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/expense_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

class HiveLocalDataResource {
  static const String _expenseBoxName = 'expenseBox';

  /// Initialize Hive and open the expense box.
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.openBox<ExpenseModel>(_expenseBoxName);
    }
  }

  /// Add a new expense to the Hive box.
  ///
  /// [expense] The expense to be added.
  Future<void> addExpense(Expense expense) async {
    await init(); // Ensure Hive is initialized and the box is open
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    final expenseModel = ExpenseModel(
      id: expense.id,
      amount: expense.amount,
      date: expense.date,
      description: expense.description,
      category: expense.category,
    );
    await box.put(expense.id, expenseModel);
  }

  /// Retrieve an expense by its ID.
  ///
  /// [id] The ID of the expense to retrieve.
  ///
  /// Returns an [Expense] if found, otherwise returns null.
  Future<Expense?> getExpense(String id) async {
    if (!Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.openBox<ExpenseModel>(_expenseBoxName);
    }
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    final expenseModel = box.get(id);
    if (expenseModel != null) {
      return Expense.fromModel(expenseModel);
    }
    return null;
  }

  /// Retrieve all expenses from the Hive box.
  ///
  /// Returns a list of [Expense] objects.
  Future<List<Expense>> getAllExpenses() async {
    if (!Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.openBox<ExpenseModel>(_expenseBoxName);
    }
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    final expenseModels = box.values.toList();
    return expenseModels.map((model) => Expense.fromModel(model)).toList();
  }

  /// Update an existing expense in the Hive box.
  ///
  /// [expense] The expense with updated details.
  Future<void> updateExpense(Expense expense) async {
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    final expenseModel = ExpenseModel(
      id: expense.id,
      amount: expense.amount,
      date: expense.date,
      description: expense.description,
      category: expense.category,
    );
    await box.put(expense.id, expenseModel);
  }

  /// Delete an expense by its ID.
  ///
  /// [id] The ID of the expense to delete.
  Future<void> deleteExpense(String id) async {
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    try {
      final exists = box.containsKey(id);
      if (exists) {
        await box.delete(id);
      }
    } catch (e) {
      rethrow; // Propagate errors for handling at a higher level
    }
  }

  /// Close the Hive box.
  Future<void> close() async {
    if (Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.box<ExpenseModel>(_expenseBoxName).close();
    }
  }
}
