import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History',
          style: GoogleFonts.getFont(
            'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            fontSize: 23,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF102DE1), Color(0xCC0D6EFF)])),
        ),
      ),
      body: const Text('history'),
    );
  }
}
