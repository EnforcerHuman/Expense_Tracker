import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/expense_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/recent_transactions/recent_transaction_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainNavigationBloc()),
        BlocProvider(
            create: (context) => RecentTransactionBloc(HiveLocalDataResource())
              ..add(GetRecentTransactions()))
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
