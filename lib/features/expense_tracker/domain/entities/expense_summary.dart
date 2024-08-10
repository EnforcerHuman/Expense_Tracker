class ExpenseSummary {
  final DateTime startDate;
  final DateTime endDate;
  final Map<String, double> categoryTotals;
  final double totalAmount;

  ExpenseSummary({
    required this.startDate,
    required this.endDate,
    required this.categoryTotals,
    required this.totalAmount,
  });
}
