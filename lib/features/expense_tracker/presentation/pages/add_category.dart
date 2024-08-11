import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymanagementapp/core/styles/app_colors.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/category_repository.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/model/category_model.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/bloc/categories_bloc/get_categories_bloc.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_button.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/custom_input_field.dart';
import 'package:moneymanagementapp/features/expense_tracker/presentation/widgets/header.dart';

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
                    // Show error message if category is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: const Text(
                            'Please enter a catergory before saving'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // Create and save new category
                    final category = CategoryModel(
                        id: Random().nextInt(10000).toString(),
                        name: categoryController.text,
                        type: 'expense');
                    categoryRepository.addCategory(category);
                    categoryRepository.getCategories();
                    categoryController.clear();
                    context.read<CategoriesBloc>().add(GetCategories());

                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('New Category Successfully added'),
                        duration: Duration(seconds: 2),
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
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
