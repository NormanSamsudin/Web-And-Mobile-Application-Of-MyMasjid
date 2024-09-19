import 'package:flutter/material.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: darkblue,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(59, 0, 79, 116),
                  spreadRadius: 0.5,
                  offset: Offset(1, 1))
            ]),
        height: 120,
        child: Center(
            child: Text('CODE : 0001',
                style: GoogleFonts.getFont(
                  'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                  fontSize: 45,
                ))),
      ),
    );
  }
}
