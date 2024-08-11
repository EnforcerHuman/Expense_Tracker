part of 'expense_category_analysis_bloc.dart';

@immutable
sealed class ExpenseCategoryAnalysisState {}

final class ExpenseCategoryAnalysisInitial
    extends ExpenseCategoryAnalysisState {}

class ExpenseCAtegoryAnalysisLoaded extends ExpenseCategoryAnalysisState {
  final List<Map<String, dynamic>> analysisData;
  final List<PieChartSectionData> chartData;

  ExpenseCAtegoryAnalysisLoaded(this.analysisData, this.chartData);
}

class ExpenseCAtegoryAnalysisError extends ExpenseCategoryAnalysisState {}
