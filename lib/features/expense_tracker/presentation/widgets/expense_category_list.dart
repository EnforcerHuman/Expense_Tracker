import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/category_card.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        height: 530,
        decoration: BoxDecoration(
            color: const Color.fromARGB(44, 158, 158, 158),
            borderRadius: BorderRadius.circular(30)),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              if (state.categories.isEmpty) {
                return const Center(
                  child: Text(
                    'NO CATEGORIES ADDED',
                    style: TextStyle(
                        color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryCard(
                        onDelete: (context) {
                          context
                              .read<CategoriesBloc>()
                              .add(DeleteCategory(state.categories[index].id));
                          context.read<CategoriesBloc>().add(GetCategories());
                        },
                        index: index,
                        name: state.categories[index].name,
                      );
                    });
              }
            } else {
              return const Center(
                child: Text('UNEXPECTED ERROR'),
              );
            }
          },
        ));
  }
}
