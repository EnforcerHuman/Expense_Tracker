class Reminder {
  final String id;
  final DateTime time;
  final String message;
  final bool isActive;

  Reminder({
    required this.id,
    required this.time,
    required this.message,
    required this.isActive,
  });
}
