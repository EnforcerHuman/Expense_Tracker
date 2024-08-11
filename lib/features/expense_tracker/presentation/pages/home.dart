import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/home_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/pie_chart_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/bottom_nav.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/category_list_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/new_transaction.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    const HomeScreen(),
    const PieChartForIncomeAndExpense(),
    // const TransactionList(),
    const AddTransaction(),
    CategoryListScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationBloc, MainNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
                const Text(
                  'Money Manager',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey.shade700,
                      size: 27,
                    ))
              ],
            ),
          ),
          body: _pages[state.selectedIndex],
          bottomNavigationBar: BottomNav(
            onTap: (index) {
              context.read<MainNavigationBloc>().add(NavigateToIndex(index));
            },
            currentIndex: state.selectedIndex,
          ),
        );
      },
    );
  }
}
