//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/edit_transaction.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/expense_card.dart';

class HomeListView extends StatelessWidget {
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;

  const HomeListView({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    context.read<RecentTransactionBloc>().add(GetRecentTransactions());

    return Container(
      margin: const EdgeInsets.all(15),
      height: 365,
      decoration: BoxDecoration(
        color: const Color.fromARGB(44, 158, 158, 158),
        borderRadius: BorderRadius.circular(30),
      ),
      child: BlocBuilder<RecentTransactionBloc, RecentTransactionState>(
        builder: (context, state) {
          if (state is RecentTransactionError) {
            return const Center(child: Text("Error loading transactions"));
          } else if (state is RecentTransactionsLoaded) {
            if (state.recentTransactions.isEmpty) {
              return const Center(
                  child: Text(
                "No transactions found",
                style: TextStyle(
                    color: Colors.greenAccent, fontWeight: FontWeight.bold),
              ));
            } else {
              return ListView.builder(
                itemCount: state.recentTransactions.length,
                itemBuilder: (BuildContext context, int index) {
                  final transaction = state.recentTransactions[index];
                  return ExpenseCard(
                      index: index,
                      transaction: transaction,
                      onDelete: onDelete,
                      onEdit: (context) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => EditExistingTransaction(
                                  expnse: state.recentTransactions[index],
                                )));
                      });
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
