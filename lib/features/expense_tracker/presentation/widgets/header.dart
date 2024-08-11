import 'package:flutter/material.dart';
import 'package:moneymanagementapp/core/styles/app_text_styles.dart';

class Header extends StatelessWidget {
  final String firstWord;
  final String secondWord;
  const Header({super.key, required this.firstWord, required this.secondWord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        '$firstWord\n $secondWord',
        style: AppTextStyles.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
