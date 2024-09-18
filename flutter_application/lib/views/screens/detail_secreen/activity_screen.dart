import 'package:flutter/material.dart';
import 'package:flutter_application/views/activity_widget/activityList_widget.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "RED",
      "YELLOW",
      "BLACK",
      "CYAN",
      "BLUE",
      "GREY",
    ];

    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
    ];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            HeaderDetailsPageWidget(),
            ActivitylistWidget()
            // Expanded(
            //   child: Container(
            //     child: VerticalCardPager(
            //         titles: titles, // required
            //         images: images, // required
            //         textStyle: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold), // optional
            //         onPageChanged: (page) {
            //           // optional
            //         },
            //         onSelectedItem: (index) {
            //           // optional
            //         },
            //         initialPage: 0, // optional
            //         align: ALIGN.CENTER, // optional
            //         physics: ClampingScrollPhysics() // optional
            //         ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
