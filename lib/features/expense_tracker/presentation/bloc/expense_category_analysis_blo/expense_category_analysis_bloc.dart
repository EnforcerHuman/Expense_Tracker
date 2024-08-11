import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/expense_category_analysis.dart';

part 'expense_category_analysis_event.dart';
part 'expense_category_analysis_state.dart';

class ExpenseCategoryAnalysisBloc
    extends Bloc<ExpenseCategoryAnalysisEvent, ExpenseCategoryAnalysisState> {
  final ExpenseCategoryAnalysisUseCase expenseCategoryAnalysisUseCase;
  ExpenseCategoryAnalysisBloc(this.expenseCategoryAnalysisUseCase)
      : super(ExpenseCategoryAnalysisInitial()) {
    on<GetExpensesByCategory>((event, emit) async {
      try {
        final analysis =
            await expenseCategoryAnalysisUseCase.getExpenseCategoryAnalysis();
        emit(ExpenseCAtegoryAnalysisLoaded(
            analysis.analysisData, analysis.chartData));
      } catch (e) {
        emit(ExpenseCAtegoryAnalysisError());
      }
    });
  }
}
