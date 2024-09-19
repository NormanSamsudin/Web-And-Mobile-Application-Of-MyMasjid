import 'package:flutter/material.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/views/common_widget/bodyText_widget.dart';
import 'package:flutter_application/views/common_widget/textClaim_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';

class ClaimWidget extends StatelessWidget {
  const ClaimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 3,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(59, 0, 79, 116),
                  spreadRadius: 0.5,
                  offset: Offset(1, 1))
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  BodyTextClaimWidget(title: 'Quota'),
                  Spacer(),
                  BodyTextClaimWidget(title: 'Available'),
                  Spacer(),
                  BodyTextClaimWidget(title: 'Redeem'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BodyTextClaimWidget(title: '1000'),
                  Spacer(),
                  BodyTextClaimWidget(title: '444'),
                  Spacer(),
                  BodyTextClaimWidget(title: '666'),
                ],
              ),
            ),
            Image.asset(
              'assets/images/korban.png',
            ),
            // GestureDetector(
            //   onTap: () {
            //     // Define the action when the container is tapped
            //     print("Redeem button pressed");
            //     // You can perform navigation or other actions here
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 10),
            //     child: BodyTextClaimWidget(
            //       title: 'Redeem',
            //     ),
            //     decoration: BoxDecoration(
            //       color: Colors.blueAccent, // Optional: Add a background color
            //       borderRadius:
            //           BorderRadius.circular(8), // Optional: Add rounded corners
            //     ),
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 12, horizontal: 16), // Optional: Add padding
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
