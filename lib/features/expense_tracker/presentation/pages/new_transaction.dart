// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/add_category.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_button.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_input_field.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/dropdown_widget.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/text_button.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  String category = 'unknown';
  @override
  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(GetCategories());
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Column(
          children: [
            Text(
              'ADD\nTRANSACTION',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomInputField(
                hintText: 'Purpose', controller: purposeTextEditingController),
            const SizedBox(
              height: 30,
            ),
            CustomInputField(
                keyboardType: TextInputType.number,
                hintText: 'Amount',
                controller: _amountTextEditingController),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(
                text: '+ Add new category',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCategory()));
                }),
            DropdownWidget(
              value: category,
              onChanged: (test) {
                setState(() {
                  category = test ?? 'test';
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                text: 'ADD',
                onPressed: () async {
                  final dataResource = HiveLocalDataResource();
                  dataResource.init();
                  final expense = Expense(
                    id: Random().nextInt(9999999).toString(),
                    amount: double.parse(_amountTextEditingController.text),
                    date: DateTime.now(),
                    description: purposeTextEditingController.text,
                    category: category,
                  );
                  await dataResource.addExpense(expense);
                  _amountTextEditingController.clear();
                  purposeTextEditingController.clear();
                  // await dataResource.getAllExpenses();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Transaction Added successfully'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
