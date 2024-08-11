import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
