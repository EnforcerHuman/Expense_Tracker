import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/reminder.dart';

@HiveType(typeId: 1)
class ReminderModel extends Reminder {
  ReminderModel({
    required super.id,
    required super.time,
    required super.message,
    required super.isActive,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json['id'],
      time: DateTime.parse(json['time']),
      message: json['message'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time.toIso8601String(),
      'message': message,
      'isActive': isActive,
    };
  }
}
