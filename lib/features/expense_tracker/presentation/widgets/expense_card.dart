import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';

class ExpenseCard extends StatelessWidget {
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;
  final Expense transaction;
  final int index;
  const ExpenseCard(
      {super.key,
      required this.transaction,
      required this.onDelete,
      required this.onEdit,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Slidable(
        key: Key(transaction.id),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                // print('pressed');
                context
                    .read<RecentTransactionBloc>()
                    .add(DeleteTransaction(transaction.id));
                context
                    .read<RecentTransactionBloc>()
                    .add(GetRecentTransactions());
                context
                    .read<ExpenseOverViewBloc>()
                    .add(ExpenseOverviewRequested());
              },
              icon: Icons.delete,
              label: 'delete',
              backgroundColor: Colors.black,
              foregroundColor: const Color.fromARGB(255, 187, 22, 10),
            ),
            SlidableAction(
              onPressed: onEdit,
              icon: Icons.edit,
              label: 'edit',
              backgroundColor: Colors.black,
              foregroundColor: Colors.grey,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.black,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                transaction.category[0], // First letter of the category
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.arrow_upward, color: Colors.red),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        transaction.description,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
            trailing: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'RS: ',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text: transaction.amount.toString(),
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
