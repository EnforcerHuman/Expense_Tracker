import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
// import 'package:sample_test/screens/home/balance/balance_calculate.dart';
// import 'package:sample_test/screens/home/balance/is_deleted.dart';

class HomeNetBal extends StatelessWidget {
  const HomeNetBal({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseOverViewBloc, ExpenseOverViewState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      state is ExpenseDataLoaded
                          ? (state.expenseOverview.dailyExpense.toString())
                          : 'NO EXPENSE AVAILABLE',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Today Expense',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            state is ExpenseDataLoaded
                                ? (state.expenseOverview.monthlyExpense
                                    .toString())
                                : 'NO EXPENSE AVAILABLE',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Current Month Expense',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            state is ExpenseDataLoaded
                                ? (state.expenseOverview.weeklyExpense
                                    .toString())
                                : 'NO EXPENSE AVAILABLE',
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Current Week Expense',
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
