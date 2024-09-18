import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/views/account_widget/bar_widget.dart';
import 'package:flutter_application/views/common_widget/headerWidget.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Column(
        children: [
          HeaderWidget(),
          BarWidget()
        ],
      ),
    );
  }
}
