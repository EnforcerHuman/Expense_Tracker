//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/core/styles/app_colors.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_category_analysis_blo/expense_category_analysis_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/chart_widget.dart';

// A stateless widget that displays a pie chart for income and expense analysis
class PieChartForIncomeAndExpense extends StatelessWidget {
  const PieChartForIncomeAndExpense({super.key});

  @override
  Widget build(BuildContext context) {
    // Triggering events to fetch the necessary data for the chart
    context.read<ExpenseCategoryAnalysisBloc>().add(GetExpensesByCategory());
    context.read<ExpenseOverViewBloc>().add(ExpenseOverviewRequested());

    return SingleChildScrollView(
      child: BlocBuilder<ExpenseCategoryAnalysisBloc,
          ExpenseCategoryAnalysisState>(
        builder: (context, state) {
          // Checking if the data is loaded
          if (state is ExpenseCAtegoryAnalysisLoaded) {
            // If there's no data to display, show a message
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
              // Display the pie chart with the loaded data
              return Column(
                children: [
                  ChartSection(
                    title: 'Expense',
                    color: AppColors.errorColor,
                    dataSet: state.chartData,
                    data: state.analysisData,
                  ),
                ],
              );
            }
          } else {
            // If the state is not loaded, display a 'NO DATA' message
            return const Center(
              child: Text('NO DATA'),
            );
          }
        },
      ),
    );
  }
}
