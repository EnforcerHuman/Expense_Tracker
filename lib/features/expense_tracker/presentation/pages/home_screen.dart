import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/total_expense_card.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/home_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ExpenseOverViewBloc>().add(ExpenseOverviewRequested());
    context.read<RecentTransactionBloc>().add(GetRecentTransactions());
    return ListView(
      children: [
        const HomeNetBal(),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('recent transactions',
                      style: GoogleFonts.poppins(
                          color: Colors.grey, fontSize: 16)),
                  GestureDetector(
                    child: Text(
                      'view all',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        HomeListView(
          onDelete: (context) {},
          onEdit: (context) {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (ctx) => EditExistingTransaction(
            //           expnse: sta,
            //         )));
          },
        ),
      ],
    );
  }
}
