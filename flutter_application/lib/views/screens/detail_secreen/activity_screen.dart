import 'package:flutter/material.dart';
import 'package:flutter_application/views/activity_widget/activityList_widget.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderDetailsPageWidget(),
            TitleWidget(title: "Activities"),
            ActivitylistWidget()
          ],
        ),
      ),
    );
  }
}
