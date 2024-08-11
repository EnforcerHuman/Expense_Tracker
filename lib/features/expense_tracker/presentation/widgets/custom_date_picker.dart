import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime? selectedDate; // Nullable DateTime
  final void Function(DateTime? date)
      onDateSelected; // Use void instead of Future<void>

  const DatePickerButton({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final selectedDateTemp = await showDatePicker(
          context: context,
          initialDate: selectedDate ??
              DateTime.now(), // Use `selectedDate` if it's not null
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now(),
        );
        if (selectedDateTemp == null) return;
        onDateSelected(selectedDateTemp); // Call the function without awaiting
      },
      icon: const Icon(Icons.calendar_today),
      label: Text(
        selectedDate == null
            ? 'Select date'
            : DateFormat('MMM dd').format(selectedDate!),
        style: GoogleFonts.poppins(
          fontSize: selectedDate == null ? 18 : 22,
        ),
      ),
    );
  }
}
