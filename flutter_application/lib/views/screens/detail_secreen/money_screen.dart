import 'package:flutter/material.dart';
import 'package:flutter_application/views/activity_widget/activityList_widget.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/lost_widget/list_widget.dart';
import 'package:flutter_application/views/money_widget/pdf_widget.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             HeaderDetailsPageWidget(),
             TitleWidget(title: "Money Records"),
             PdfWidget(),
          ],
        ),
      ),
    );
  }
}
