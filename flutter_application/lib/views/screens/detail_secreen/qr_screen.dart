import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/qr_widget/displayQR_widget.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [HeaderDetailsPageWidget(), DisplayQrWidget()],
      ),
    );
  }
}
