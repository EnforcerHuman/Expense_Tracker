//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

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
          print(state);
          if (state is RecentTransactionError) {
            return const Center(child: Text("Error loading transactions"));
          } else if (state is RecentTransactionsLoaded) {
            if (state.recentTransactions.isEmpty) {
              return const Center(child: Text("No transactions found"));
            }

            return ListView.builder(
              itemCount: state.recentTransactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = state.recentTransactions[index];

                return Container(
                  margin: const EdgeInsets.all(5),
                  child: Slidable(
                    key: Key(transaction.id),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.grey.shade900,
                              content: Text(
                                'deleted',
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ));
                          },
                          icon: Icons.delete,
                          label: 'delete',
                          backgroundColor: Colors.black,
                          foregroundColor:
                              const Color.fromARGB(255, 187, 22, 10),
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Add edit functionality here
                          },
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
                            transaction
                                .category[0], // First letter of the category
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
                                Icon(
                                  // transaction.isExpense
                                  //     ? Icons.arrow_upward
                                  //     :
                                  Icons.arrow_downward,
                                  color:
                                      //  transaction.isExpense
                                      //     ? Colors.red
                                      //     :
                                      Colors.green,
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    transaction.category,
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
                                  color:
                                      // transaction.isExpense
                                      //     ?
                                      Colors.red,
                                  // : Colors.green,
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
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
