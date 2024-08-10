import 'package:hive/hive.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/income.dart';

part 'income_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final String source;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String? notes;

  IncomeModel({
    required this.id,
    required this.amount,
    required this.source,
    required this.date,
    this.notes,
  });

  // Convert IncomeModel to Income (domain entity)
  Income toEntity() {
    return Income(
      id: id,
      amount: amount,
      source: source,
      date: date,
      notes: notes,
    );
  }

  // Factory constructor to create IncomeModel from Income (domain entity)
  factory IncomeModel.fromEntity(Income income) {
    return IncomeModel(
      id: income.id,
      amount: income.amount,
      source: income.source,
      date: income.date,
      notes: income.notes,
    );
  }

  @override
  String toString() {
    return 'IncomeModel{id: $id, amount: $amount, source: $source, date: $date, notes: $notes}';
  }
}
