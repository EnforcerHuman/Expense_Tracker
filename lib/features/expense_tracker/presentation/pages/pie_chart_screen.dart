import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PieChartForIncomeAndExpense extends StatefulWidget {
  const PieChartForIncomeAndExpense({super.key});

  @override
  State<PieChartForIncomeAndExpense> createState() =>
      _PieChartForIncomeAndExpenseState();
}

class _PieChartForIncomeAndExpenseState
    extends State<PieChartForIncomeAndExpense> {
  List<PieChartSectionData> incomeDataSet = [];
  List<PieChartSectionData> expenseDataSet = [];

  // Sample data for income and expense categories
  List<Map<String, dynamic>> incomeData = [
    {'category': 'Salary', 'amount': 5000.0},
    {'category': 'Freelance', 'amount': 2000.0},
    {'category': 'Investments', 'amount': 1000.0},
  ];

  List<Map<String, dynamic>> expenseData = [
    {'category': 'Rent', 'amount': 1500.0},
    {'category': 'Food', 'amount': 800.0},
    {'category': 'Utilities', 'amount': 400.0},
    {'category': 'Entertainment', 'amount': 300.0},
  ];

  @override
  void initState() {
    super.initState();
    prepareChartData();
  }

  void prepareChartData() {
    // Ensure that 'amount' is treated as a double
    incomeDataSet = List.generate(incomeData.length, (index) {
      final amount = (incomeData[index]['amount'] as num).toDouble();
      return PieChartSectionData(
        value: amount,
        color: index % 2 == 0 ? Colors.green.shade300 : Colors.green.shade700,
        titleStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
        title:
            '${((amount / (incomeData.fold<double>(0, (sum, item) => sum + (item['amount'] as num).toDouble())) * 100)).toStringAsFixed(1)}%',
        radius: 100,
      );
    });

    expenseDataSet = List.generate(expenseData.length, (index) {
      final amount = (expenseData[index]['amount'] as num).toDouble();
      return PieChartSectionData(
        value: amount,
        color: index % 2 == 0 ? Colors.red.shade300 : Colors.red.shade700,
        titleStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
        title:
            '${((amount / (expenseData.fold<double>(0, (sum, item) => sum + (item['amount'] as num).toDouble())) * 100)).toStringAsFixed(1)}%',
        radius: 100,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildChartSection('Income', Colors.green, incomeDataSet, incomeData),
          const SizedBox(height: 45),
          _buildChartSection(
              'Expense', Colors.red, expenseDataSet, expenseData),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildChartSection(String title, Color color,
      List<PieChartSectionData> dataSet, List<Map<String, dynamic>> data) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(color: color, fontSize: 25),
        ),
        SizedBox(
          height: 350,
          child: PieChart(PieChartData(
            centerSpaceRadius: 0,
            sections: dataSet,
          )),
        ),
        Container(
          height: 215,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[800],
            child: ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final amount = (data[index]['amount'] as num).toDouble();
                final total = data.fold<double>(
                    0, (sum, item) => sum + (item['amount'] as num).toDouble());
                final percentage = (amount / total * 100).toStringAsFixed(1);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.poppins(
                        color: index % 2 == 0 ? Colors.grey : color,
                      ),
                    ),
                  ),
                  title: Text(data[index]['category']),
                  titleTextStyle: GoogleFonts.poppins(
                      color: index % 2 == 0 ? Colors.grey : color,
                      fontSize: 17),
                  trailing: Text(
                    '${percentage}%',
                    style: GoogleFonts.poppins(
                        color: index % 2 == 0 ? Colors.grey : color,
                        fontSize: 15),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
