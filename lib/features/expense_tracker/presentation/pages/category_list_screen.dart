import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/add_category.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/expense_category_list.dart';

// ignore: must_be_immutable
class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  bool isSelectedIncome = true;

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ExpenseCategoryList(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const AddCategory()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(44, 158, 158, 158),
              ),
              child: Center(
                child: Text(
                  '+ Add new category',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
