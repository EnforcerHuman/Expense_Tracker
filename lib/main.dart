import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/category_repository.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/category_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/expense_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/expense_category_analysis.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/usecases/expense_use_case.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_category_analysis_blo/expense_category_analysis_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/expense_over_view_bloc/expense_over_view_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/home.dart';
import 'package:moneymanagementapp/features/notification/data/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainNavigationBloc()),
        BlocProvider(
            create: (context) =>
                RecentTransactionBloc(ExpenseUseCases(HiveLocalDataResource()))
                  ..add(GetRecentTransactions())),
        BlocProvider(
            create: (context) =>
                CategoriesBloc(CategoryRepository())..add(GetCategories())),
        BlocProvider(
            create: (context) => ExpenseCategoryAnalysisBloc(
                ExpenseCategoryAnalysisUseCase(
                    HiveLocalDataResource(), CategoryRepository()))
              ..add(GetExpensesByCategory())),
        BlocProvider(
            create: (context) =>
                ExpenseOverViewBloc(ExpenseUseCases(HiveLocalDataResource())))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}
