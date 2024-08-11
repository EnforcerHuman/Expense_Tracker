import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_category_analysis_blo/expense_category_analysis_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/chart_widget.dart';

class PieChartForIncomeAndExpense extends StatelessWidget {
  const PieChartForIncomeAndExpense({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExpenseCategoryAnalysisBloc>().add(GetExpensesByCategory());
    context.read<ExpenseOverViewBloc>().add(ExpenseOverviewRequested());

    return SingleChildScrollView(
      child: BlocBuilder<ExpenseCategoryAnalysisBloc,
          ExpenseCategoryAnalysisState>(
        builder: (context, state) {
          if (state is ExpenseCAtegoryAnalysisLoaded) {
            if (state.analysisData.isEmpty) {
              return const Center(
                child: Text(
                  'ADD A TRANSACTION TO VIEW THE DIAGRAM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  ChartSection(
                      title: 'Expense',
                      color: Colors.red,
                      dataSet: state.chartData,
                      data: state.analysisData)
                ],
              );
            }
          } else {
            return const Center(
              child: Text('NO DATA '),
            );
          }
        },
      ),
    );
  }
}
