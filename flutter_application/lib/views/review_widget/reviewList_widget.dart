import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/controllers/review_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/views/common_widget/bodySubText_widget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewlistWidget extends StatefulWidget {
  ReviewlistWidget({super.key});

  @override
  State<ReviewlistWidget> createState() => _ReviewlistWidgetState();
}

class _ReviewlistWidgetState extends State<ReviewlistWidget> {
  late Future<List<ReviewModel>> futureReviews;

  @override
  void initState() {
    super.initState();
    futureReviews = ReviewController().loadReviews();
  }

  Future<void> loadReviews() async {
    setState(() {
      futureReviews = ReviewController().loadReviews(); // Reload reviews
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.73,
      child: FutureBuilder(
          future: futureReviews,
          builder: (constext, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Reviews'),
              );
            } else {
              final reviews = snapshot.data!;

              return RefreshIndicator(
                onRefresh: loadReviews,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    final review = reviews[index];
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return review.imageUrl.isNotEmpty
                                ? Dialog(
                                    child: InteractiveViewer(
                                      panEnabled:
                                          false, // Can be set to false to disable panning
                                      boundaryMargin: const EdgeInsets.all(20),
                                      minScale: 0.5,
                                      maxScale: 4.0,
                                      child: Image.network(
                                        review.imageUrl.toString(),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                        );
                      },
                      child: SizedBox(
                        child: ListTile(
                          title: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: const CircleAvatar(
                                            radius: 15,
                                            child: Icon(Icons.person),
                                            // backgroundImage: NetworkImage(review
                                            //     .imageUrl), // Load user's image
                                            //onBackgroundImageError: (_, __) {
                                            // Handle error while loading image
                                            //},
                                          ),
                                        ),
                                        const Spacer()
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(review
                                                  .userId), // Display the user name
                                              const SizedBox(
                                                  width:
                                                      8), // Add space between the name and stars
                                              Row(
                                                children: List.generate(
                                                  review
                                                      .rating, // Generate stars based on rating
                                                  (index) => const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size:
                                                        16, // Adjust star size as needed
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            review.message,
                                            style: GoogleFonts.getFont(
                                              'Rubik',
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                          review.imageUrl.isNotEmpty
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, left: 5),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.network(
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        fit: BoxFit.fill,
                                                        review.imageUrl
                                                            .toString()),
                                                  ),
                                                )
                                              : Container(),
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: Text('23/12/2024',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
