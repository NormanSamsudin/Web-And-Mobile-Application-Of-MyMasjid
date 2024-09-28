import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodySubTextWidget extends StatelessWidget {
  final String title;
  const BodySubTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 32,
      child: Text(
          title,
          style: GoogleFonts.getFont(
            'Rubik',
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          maxLines: 3, // Allows a maximum of 2 lines
          overflow: TextOverflow.ellipsis, // Shows '...' if the text overflows
        ),
    );
  }
}
