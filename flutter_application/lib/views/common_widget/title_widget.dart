import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Text(
        title,
        style: GoogleFonts.getFont('Rubik',
            color: const Color.fromARGB(255, 27, 73, 101),
            fontWeight: FontWeight.normal,
            fontSize: 20,
            letterSpacing: 1.1),
      ),
    );
  }
}
