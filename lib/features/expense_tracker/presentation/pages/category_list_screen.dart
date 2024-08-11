import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/core/styles/app_text_styles.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/add_category.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/expense_category_list.dart';

// CategoryListScreen widget for displaying and managing expense categories
// ignore: must_be_immutable
class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  // Flag to determine if income is selected (unused in current implementation)
  bool isSelectedIncome = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Widget to display the list of expense categories
          const ExpenseCategoryList(),

          // Custom button to add a new category
          GestureDetector(
            onTap: () {
              // Navigate to AddCategory screen when tapped
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const AddCategory()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 300,
              height: 40,
              // Styling for the add category button
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(44, 158, 158, 158),
              ),
              child: const Center(
                child: Text(
                  '+ Add new category',
                  style: AppTextStyles.buttonText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
