import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/mosque_controller.dart';
import 'package:flutter_application/views/common_widget/headerWidget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_application/views/home_widget/banner_widget.dart';
import 'package:flutter_application/views/home_widget/service_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MosqueController authController = MosqueController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.setMosqueId('66ea2d0f948e462d23821a23');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
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
