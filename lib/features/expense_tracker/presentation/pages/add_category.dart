import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              const Header(),
              SizedBox(height: 50),
              CustomInputField(
                hintText: 'Category Type',
                controller: categoryController,
              ),
              const SizedBox(height: 20),
              const CategoryTypeSelector(),
              SizedBox(height: 50),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  // Handle save action
                },
              ),
              SizedBox(height: 10),
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

// Header widget
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        'ADD\n CATEGORY',
        style: GoogleFonts.poppins(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlign: textAlign,
      style: const TextStyle(color: Colors.green),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

// Category type selector widget
class CategoryTypeSelector extends StatelessWidget {
  const CategoryTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CategoryRadioButton(value: 0, label: 'Income', groupValue: 1),
        SizedBox(width: 20),
        _CategoryRadioButton(value: 1, label: 'Expense', groupValue: 1),
      ],
    );
  }
}

// Radio button for category type
class _CategoryRadioButton extends StatelessWidget {
  final int value;
  final String label;
  final int groupValue;

  const _CategoryRadioButton({
    required this.value,
    required this.label,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (newValue) {},
        ),
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.green, fontSize: 18),
        ),
      ],
    );
  }
}

// Save button widget

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.green, // Default color
    this.textColor = Colors.black, // Default text color
    this.padding = const EdgeInsets.symmetric(vertical: 15), // Default padding
    this.borderRadius = 25.0, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(color: textColor),
        ),
      ),
    );
  }
}

// Back button widget
class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          'Back',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
      ),
    );
  }
}
