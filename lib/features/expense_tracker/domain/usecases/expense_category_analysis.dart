import 'package:moneymanagementapp/features/expense_tracker/data/category_repository.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense_category_analysis.dart';

class ExpenseCategoryAnalysisUseCase {
  final HiveLocalDataResource expenseRepository;
  final CategoryRepository categoryRepository;

  ExpenseCategoryAnalysisUseCase(
      this.expenseRepository, this.categoryRepository);

  /// Retrieve and analyze expenses by category.
  ///
  /// Returns an [ExpenseCategoryAnalysis] containing analysis data and chart data.
  Future<ExpenseCategoryAnalysis> getExpenseCategoryAnalysis() async {
    try {
      // Fetch all expenses and categories
      final List<Expense> expenses = await expenseRepository.getAllExpenses();
      final List<Category> categories =
          await categoryRepository.getCategories();

      // Calculate total expense
      double totalExpense =
          expenses.fold(0, (sum, expense) => sum + expense.amount);

      // Initialize category totals map
      Map<String, double> categoryTotals = {
        for (var category in categories) category.name: 0.0
      };

      // Accumulate expense totals for each category
      for (var expense in expenses) {
        if (categoryTotals.containsKey(expense.category)) {
          categoryTotals[expense.category] =
              categoryTotals[expense.category]! + expense.amount;
        }
      }

      // Prepare analysis and chart data
      List<Map<String, dynamic>> analysisData = [];
      List<PieChartSectionData> chartData = [];

      int index = 0;
      categoryTotals.forEach((category, amount) {
        double percentage = (amount / totalExpense) * 100;
        analysisData.add({
          'category': category,
          'amount': amount,
          'percentage': double.parse(percentage.toStringAsFixed(1)),
        });

        chartData.add(PieChartSectionData(
          value: amount,
          color: index % 2 == 0 ? Colors.red.shade300 : Colors.red.shade700,
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 100,
          titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
        ));

        index++;
      });

      // Sort analysis data by amount in descending order
      analysisData.sort(
          (a, b) => (b['amount'] as double).compareTo(a['amount'] as double));

      return ExpenseCategoryAnalysis(
        analysisData: analysisData,
        chartData: chartData,
      );
    } catch (e) {
      // Return empty analysis data and chart data in case of error
      return ExpenseCategoryAnalysis(
        analysisData: [],
        chartData: [],
      );
    }
  }
}
