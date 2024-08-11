import 'package:flutter/material.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/edit_screen_use_case.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_button.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_input_field.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/header.dart';

// Widget for editing an existing transaction
class EditExistingTransaction extends StatelessWidget {
  final Expense expnse;
  const EditExistingTransaction({super.key, required this.expnse});

  @override
  Widget build(BuildContext context) {
    // Initialize the use case for updating expenses
    UpdateExpenseUseCase updateExpenseUseCase = UpdateExpenseUseCase();

    // Controllers for input fields, pre-filled with existing expense data
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
              // Header for the edit screen
              const Header(
                firstWord: 'Edit',
                secondWord: 'Transaction',
              ),
              const SizedBox(height: 50),
              // Input field for the transaction purpose
              CustomInputField(
                hintText: 'Purpose',
                controller: purposeController,
              ),
              const SizedBox(
                height: 40,
              ),
              // Input field for the transaction amount
              CustomInputField(
                hintText: 'Amount',
                controller: ampountController,
              ),
              const SizedBox(height: 50),
              // Save button to confirm edits
              CustomButton(
                  text: 'Save',
                  onPressed: () {
                    // Call the use case to submit the edited transaction
                    updateExpenseUseCase.onEditSubmitted(
                        expnse,
                        ampountController.text,
                        purposeController.text,
                        context);
                  }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
