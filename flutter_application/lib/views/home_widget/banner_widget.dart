import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/banner_controller.dart';
import 'package:flutter_application/models/banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_application/glabal_variable.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> futureBanners;
  late PageController _pageController; // Add a PageController
  int _currentPage = 0; // Keep track of the current page

  @override
  void initState() {
    super.initState();
    futureBanners = BannerController().loadBanners();
    _pageController = PageController(); // Initialize the PageController
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: FutureBuilder(
            future: futureBanners,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Banners'),
                );
              } else {
                final banner = snapshot.data!;
                return Stack(children: [
                  //
                  PageView.builder(
                    controller: _pageController,
                    itemCount: banner.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // boxShadow: [
                            //   BoxShadow(

                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 3,
                            //     blurRadius: 5,
                            //     offset: const Offset(
                            //         1, 1),
                            //   ),
                            // ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              banner[index].image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 8,
                    left: MediaQuery.of(context).size.width / 2 - 53,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: banner.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey, // Unselected dot color
                        activeDotColor: darkblue, // Selected dot color
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                ]);
              }
            }),
      ),
    );
  }
}
