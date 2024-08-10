class Income {
  final String id;
  final double amount;
  final String source;
  final DateTime date;
  final String? notes;

  Income({
    required this.id,
    required this.amount,
    required this.source,
    required this.date,
    this.notes,
  });

  // Add any domain-specific methods if needed

  @override
  String toString() {
    return 'Income{id: $id, amount: $amount, source: $source, date: $date, notes: $notes}';
  }
}
