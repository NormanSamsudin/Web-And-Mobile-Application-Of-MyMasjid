import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/qr_widget/displayQR_widget.dart';
import 'package:flutter_application/views/review_widget/reviewList_widget.dart';
import 'package:flutter_application/glabal_variable.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
            const TitleWidget(title: "Reviews"),
            ReviewlistWidget()
          ],
        ),
      ),
    );
  }
}
