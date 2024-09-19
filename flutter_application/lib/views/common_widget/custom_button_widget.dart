import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blueAccent, // Button background color
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              buttonName, // The button name text
              style: const TextStyle(
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Button text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
