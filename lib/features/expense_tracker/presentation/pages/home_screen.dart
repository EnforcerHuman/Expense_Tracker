import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/core/styles/app_text_styles.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/total_expense_card.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/home_listview.dart';

// Main widget for the home screen of the expense tracker app
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger events to fetch expense overview and recent transactions
    context.read<ExpenseOverViewBloc>().add(ExpenseOverviewRequested());
    context.read<RecentTransactionBloc>().add(GetRecentTransactions());

    return ListView(
      children: [
        // Widget to display the net balance
        const HomeNetBal(),
        const SizedBox(
          height: 13,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Header for recent transactions section
                  Text('recent transactions', style: AppTextStyles.bodyText2),
                ],
              ),
            ],
          ),
        ),
        // ListView widget to display recent transactions
        HomeListView(
          onDelete: (context) {}, // Placeholder for delete functionality
          onEdit: (context) {}, // Placeholder for edit functionality
        ),
      ],
    );
  }
}
