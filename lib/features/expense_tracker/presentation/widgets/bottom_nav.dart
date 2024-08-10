import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'chart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'translations',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add),
          label: 'Add',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'category',
        ),
      ],
    );
  }
}
