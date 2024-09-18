import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTextWidget extends StatelessWidget {
  final String title;
  const BodyTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 32,
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.getFont(
            'Rubik',
            color: const Color.fromARGB(255, 27, 73, 101),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          maxLines: 2, // Allows a maximum of 2 lines
          overflow: TextOverflow.ellipsis, // Shows '...' if the text overflows
        ),
      ),
    );
  }
}
