import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartSection extends StatelessWidget {
  final String title;
  final Color color;
  final List<PieChartSectionData> dataSet;
  final List<Map<String, dynamic>> data;

  const ChartSection({
    super.key,
    required this.title,
    required this.color,
    required this.dataSet,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
                    '$percentage %',
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
