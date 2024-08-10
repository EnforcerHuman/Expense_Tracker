import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_state.dart';

class MainNavigationBloc
    extends Bloc<MainNavigationEvent, MainNavigationState> {
  MainNavigationBloc() : super(MainNavigationState(0)) {
    on<NavigateToIndex>(
        (event, emit) => emit(MainNavigationState(event.index)));
  }
}
