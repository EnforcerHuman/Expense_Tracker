import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/category_repository.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/category_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_button.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_input_field.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/header.dart';

// Main widget

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(
                firstWord: 'ADD',
                secondWord: 'CATEGORY',
              ),
              const SizedBox(height: 50),
              CustomInputField(
                hintText: 'Category Type',
                controller: categoryController,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 50),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  CategoryRepository categoryRepository = CategoryRepository();

                  if (categoryController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            'Please enter a catergory before saving'),
                        duration:
                            const Duration(seconds: 2), // Snackbar duration
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Handle the Undo action
                          },
                        ),
                      ),
                    );
                  } else {
                    final category = CategoryModel(
                        id: Random().nextInt(10000).toString(),
                        name: categoryController.text,
                        type: 'expense');
                    categoryRepository.addCategory(category);
                    categoryRepository.getCategories();
                    categoryController.clear();
                    context.read<CategoriesBloc>().add(GetCategories());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('New Category Successfully added'),
                        duration:
                            const Duration(seconds: 2), // Snackbar duration
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Handle the Undo action
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
