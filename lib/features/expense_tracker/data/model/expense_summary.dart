import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense_summary.dart';

class ExpenseSummaryModel extends ExpenseSummary {
  ExpenseSummaryModel({
    required super.startDate,
    required super.endDate,
    required super.categoryTotals,
    required super.totalAmount,
  });

  factory ExpenseSummaryModel.fromJson(Map<String, dynamic> json) {
    return ExpenseSummaryModel(
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      categoryTotals: Map<String, double>.from(json['categoryTotals']),
      totalAmount: json['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'categoryTotals': categoryTotals,
      'totalAmount': totalAmount,
    };
  }
}
