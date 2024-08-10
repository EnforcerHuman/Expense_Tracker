// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:moneymanagementapp/features/expense_tracker/data/hive_data_source.dart';
import 'package:moneymanagementapp/features/expense_tracker/domain/entities/expense.dart';

import 'package:moneymanagementapp/features/expense_tracker/presentation/pages/add_category.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;

  String? _categoryID;
  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: Column(
          children: [
            Text(
              'ADD\nTRANSACTION',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _purposeTextEditingController,
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'purpose',
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 5, color: Colors.green),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _amountTextEditingController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'amount',
                hintStyle:
                    GoogleFonts.poppins(color: Colors.grey, fontSize: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 5, color: Colors.green),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(value: 20, groupValue: 'test', onChanged: (_) {}),
                Text(
                  'income',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
                ),
                const SizedBox(
                  width: 15,
                ),
                Radio(
                    value: 'expense',
                    groupValue: 'selected category type',
                    onChanged: (_) {}),
                Text(
                  'expense',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 20),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCategory()),
                  );
                },
                child: Text(
                  '+ Add new category',
                  style: GoogleFonts.poppins(fontSize: 18),
                )),
            DropdownButton(
                value: _categoryID,
                hint: Text(
                  'select category',
                  style: GoogleFonts.poppins(color: Colors.green, fontSize: 17),
                ),
                items: (['test1', 'test 2']).map((e) {
                  return DropdownMenuItem(
                      onTap: () {
                        // _selectedCategoryModel = e;
                      },
                      value: '123',
                      child: Text(
                        'e.name',
                        style: GoogleFonts.poppins(
                            color: Colors.green, fontSize: 23),
                      ));
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            //select Date
            TextButton.icon(
              onPressed: () async {
                final _selectedDateTemp = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 30)),
                  lastDate: DateTime.now(),
                );
                if (_selectedDateTemp == null) return;
                setState(() {
                  _selectedDate = _selectedDateTemp;
                });
              },
              icon: const Icon(Icons.calendar_today),
              label: Text(
                  _selectedDate == null
                      ? 'select date'
                      : DateFormat('MMM dd').format(_selectedDate!),
                  style: _selectedDate == null
                      ? GoogleFonts.poppins(fontSize: 18)
                      : GoogleFonts.poppins(fontSize: 22)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () async {
                    final dataResource = HiveLocalDataResource();
                    dataResource.init();
                    final expense = Expense(
                      id: '3',
                      amount: 100.0,
                      date: DateTime.now(),
                      description: 'Lunch',
                      category: 'Food',
                    );
                    await dataResource.addExpense(expense);
                    final expenses = await dataResource.getAllExpenses();
                    print(expenses.length);
                  },
                  child: Text(
                    'Add',
                    style: GoogleFonts.poppins(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
