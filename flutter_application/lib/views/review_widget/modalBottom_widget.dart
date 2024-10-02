import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModalbottomWidget extends StatelessWidget {
  const ModalbottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Modal Bottom Sheet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text('This is a modal bottom sheet. You can put any widget here.'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the modal when button is pressed
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}