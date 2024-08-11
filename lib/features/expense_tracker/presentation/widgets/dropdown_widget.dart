// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymanagementapp/core/styles/app_text_styles.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';

class DropdownWidget extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;
  const DropdownWidget(
      {super.key, required this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return DropdownButton<String>(
            value: state.categories.map((e) => e.name).contains(value)
                ? value
                : null,
            hint: Text(
              'Select a category',
              style: GoogleFonts.poppins(color: Colors.green, fontSize: 17),
            ),
            items: state.categories.map((e) {
              return DropdownMenuItem<String>(
                value: e.name,
                child: Text(
                  e.name,
                  style: AppTextStyles.bodyText3,
                ),
              );
            }).toList(),
            onChanged: onChanged,
          );
        } else {
          return const Text('Add a category');
        }
      },
    );
  }
}
