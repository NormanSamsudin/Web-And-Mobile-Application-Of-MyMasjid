import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/views/common_widget/headerWidget.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await _authController.signOutUsers(context: context);
                },
                child: Text('Sign out')),
          ),
        ],
      ),
    );
  }
}
