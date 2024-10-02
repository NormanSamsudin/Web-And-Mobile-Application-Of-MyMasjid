import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/headerWidgetDetailPage.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/qr_widget/displayQR_widget.dart';
import 'package:flutter_application/views/review_widget/modalBottom_widget.dart';
import 'package:flutter_application/views/review_widget/reviewList_widget.dart';
import 'package:flutter_application/glabal_variable.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  // Function to show the bottom modal sheet
  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ModalbottomWidget();
      },
    );
  }

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
      floatingActionButton: InkWell(
          onTap: () {
            _showModalSheet(context);
          },
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: darkblue,
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
