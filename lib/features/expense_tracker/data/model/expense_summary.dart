import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense_summary.dart';

class ExpenseSummaryModel extends ExpenseSummary {
  ExpenseSummaryModel({
    required DateTime startDate,
    required DateTime endDate,
    required Map<String, double> categoryTotals,
    required double totalAmount,
  }) : super(
          startDate: startDate,
          endDate: endDate,
          categoryTotals: categoryTotals,
          totalAmount: totalAmount,
        );

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
