import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  const SubtitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Text(
        title,
        style: GoogleFonts.getFont('Rubik',
            color: const Color.fromARGB(255, 139, 139, 139),
            fontWeight: FontWeight.normal,
            fontSize: 16,
            letterSpacing: 1.1),
      ),
    );
  }
}
