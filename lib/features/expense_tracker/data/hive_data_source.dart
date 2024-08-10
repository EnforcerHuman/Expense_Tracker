import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/expense_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

class HiveLocalDataResource {
  static const String _expenseBoxName = 'expenseBox';

  // Initialize Hive and open the box
  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.openBox<ExpenseModel>(_expenseBoxName);
    }
  }

  // Add a new expense
  Future<void> addExpense(Expense expense) async {
    init();
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

  // Get an expense by ID
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

  // Get all expenses
  Future<List<Expense>> getAllExpenses() async {
    if (!Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.openBox<ExpenseModel>(_expenseBoxName);
    }
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    final expenseModels = box.values.toList();
    return expenseModels.map((model) => Expense.fromModel(model)).toList();
  }

  // Update an existing expense
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

  // Delete an expense by ID
  Future<void> deleteExpense(String id) async {
    final box = Hive.box<ExpenseModel>(_expenseBoxName);
    await box.delete(id);
  }

  // Close the Hive box
  Future<void> close() async {
    if (Hive.isBoxOpen(_expenseBoxName)) {
      await Hive.box<ExpenseModel>(_expenseBoxName).close();
    }
  }
}
