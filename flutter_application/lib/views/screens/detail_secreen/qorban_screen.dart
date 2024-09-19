import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/custom_button_widget.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/qorban_widget/claim_widget.dart';
import 'package:flutter_application/views/qorban_widget/ticket_widget.dart';
import 'package:flutter_application/views/qr_widget/displayQR_widget.dart';

class QorbanScreen extends StatelessWidget {
  const QorbanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderDetailsPageWidget(),
          TicketWidget(),
          Divider(indent: 5, endIndent: 5,),
          TitleWidget(title: 'Redeem Coupon'),
          ClaimWidget(),
          Spacer(),
          CustomButtonWidget(buttonName: 'Redeem', onPressed: (){}),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
