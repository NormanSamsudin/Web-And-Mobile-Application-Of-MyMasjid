import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/headerWidget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/home_widget/banner_widget.dart';
import 'package:flutter_application/views/home_widget/service_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),

        //appBar: PreferredSize(preferredSize: Size.fromHeight(200), child: AppBar()),
        // AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'Train Schedule',
        //     style: GoogleFonts.getFont(
        //       'Lato',
        //       color: Colors.white,
        //       fontWeight: FontWeight.bold,
        //       letterSpacing: 0.2,
        //       fontSize: 23,
        //     ),
        //   ),
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             begin: Alignment.topLeft,
        //             end: Alignment.bottomRight,
        //             colors: <Color>[Color(0xFF102DE1), Color(0xCC0D6EFF)])),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              TitleWidget(title: "With Us"),
              SubtitleWidget(title: 'Combine faith and technology'),
              BannerWidget(),
              TitleWidget(title: "Our Services"),
              ServiceWidget()
            ],
          ),
        ));
  }
}
