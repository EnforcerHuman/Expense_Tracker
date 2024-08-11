// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:moneymanagementapp/core/styles/app_colors.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_event.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_state.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/home_screen.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/pie_chart_screen.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/bottom_nav.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/category_list_screen.dart';
// import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/new_transaction.dart';

// class Home extends StatelessWidget {
//   Home({super.key});

//   final _pages = [
//     const HomeScreen(),
//     const PieChartForIncomeAndExpense(),
//     const AddTransaction(),
//     CategoryListScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainNavigationBloc, MainNavigationState>(
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: AppColors.backgroundColor,
//           appBar: AppBar(
//             toolbarHeight: 80,
//             backgroundColor: AppColors.backgroundColor,
//             title: const Center(
//               child: Text(
//                 'Money Manager',
//                 style: TextStyle(
//                     color: Colors.green,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w900),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           body: _pages[state.selectedIndex],
//           bottomNavigationBar: BottomNav(
//             onTap: (index) {
//               context.read<MainNavigationBloc>().add(NavigateToIndex(index));
//             },
//             currentIndex: state.selectedIndex,
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/core/styles/app_colors.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/home_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/pie_chart_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/bottom_nav.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/category_list_screen.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/new_transaction.dart';

/// [Home] widget is the main entry point for the navigation in the
/// expense tracker app. It manages navigation between different pages
/// using a bottom navigation bar.
class Home extends StatelessWidget {
  Home({super.key});

  /// A list of pages corresponding to each tab in the bottom navigation bar.
  final _pages = [
    const HomeScreen(), // Home screen page
    const PieChartForIncomeAndExpense(), // Pie chart screen page
    const AddTransaction(), // Add transaction screen page
    CategoryListScreen() // Category list screen page
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationBloc, MainNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: AppColors.backgroundColor,
            title: const Center(
              child: Text(
                'Money Manager', // Title of the app
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Display the currently selected page from the _pages list
          body: _pages[state.selectedIndex],

          // Custom bottom navigation bar for navigation between different screens
          bottomNavigationBar: BottomNav(
            onTap: (index) {
              // Trigger navigation event in the Bloc when a tab is selected
              context.read<MainNavigationBloc>().add(NavigateToIndex(index));
            },
            // Pass the current selected index from the Bloc state to the
            // bottom navigation bar
            currentIndex: state.selectedIndex,
          ),
        );
      },
    );
  }
}
