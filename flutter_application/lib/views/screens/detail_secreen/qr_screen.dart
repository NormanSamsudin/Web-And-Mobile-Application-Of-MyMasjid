import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/qr_widget/button_stripe.dart';
import 'package:flutter_application/views/qr_widget/displayQR_widget.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderDetailsPageWidget(),
          const TitleWidget(title: "QR Code"),
          DisplayQrWidget(),
          Spacer(),
          PaymentStripeButton()
        ],
      ),
    );
  }
}
