// lib/data/models/expense_model.dart

import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String category;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.description,
    required this.category,
  });
}
