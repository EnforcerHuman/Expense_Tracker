class ExpenseOverview {
  final double dailyExpense;
  final double weeklyExpense;
  final double monthlyExpense;

  ExpenseOverview({
    required this.dailyExpense,
    required this.weeklyExpense,
    required this.monthlyExpense,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() => {
        'totalExpense': dailyExpense,
        'weeklyExpense': weeklyExpense,
        'monthlyExpense': monthlyExpense,
      };

  @override
  String toString() {
    return 'ExpenseOverview(totalExpense: $dailyExpense, weeklyExpense: $weeklyExpense, monthlyExpense: $monthlyExpense)';
  }
}
