import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_button.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_input_field.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/header.dart';

// Main widget

class EditExistingTransaction extends StatelessWidget {
  final Expense expnse;
  const EditExistingTransaction({super.key, required this.expnse});

  @override
  Widget build(BuildContext context) {
    TextEditingController purposeController =
        TextEditingController(text: expnse.description);
    TextEditingController ampountController =
        TextEditingController(text: expnse.amount.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(
                firstWord: 'Edit',
                secondWord: 'Transaction',
              ),
              const SizedBox(height: 50),
              CustomInputField(
                hintText: 'Purpose',
                controller: purposeController,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomInputField(
                hintText: 'Amount',
                controller: ampountController,
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  final expense = Expense(
                      id: expnse.id,
                      amount: double.parse(ampountController.text),
                      date: expnse.date,
                      description: purposeController.text,
                      category: expnse.category);
                  context
                      .read<RecentTransactionBloc>()
                      .add(EditTransaction(expense));
                  context
                      .read<ExpenseOverViewBloc>()
                      .add(ExpenseOverviewRequested());
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Transaction updated successfully'),
                      duration: Duration(seconds: 2), // Snackbar duration
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
