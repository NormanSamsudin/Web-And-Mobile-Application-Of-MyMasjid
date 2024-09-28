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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
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

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  final review = reviews[index];
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: InteractiveViewer(
                              panEnabled:
                                  false, // Can be set to false to disable panning
                              boundaryMargin: const EdgeInsets.all(20),
                              minScale: 0.5,
                              maxScale: 4.0,
                              child: Image.network(
                                review.imageUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(review
                                            .imageUrl), // Load user's image
                                        onBackgroundImageError: (_, __) {
                                          // Handle error while loading image
                                        },
                                      ),
                                    ),
                                    Spacer()
                                  ],
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 102,
                                  child: Column(
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // leading:
                        //    Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       CircleAvatar(
                        //         radius: 15,
                        //         backgroundImage: NetworkImage(
                        //             review.imageUrl), // Load user's image
                        //         onBackgroundImageError: (_, __) {
                        //           // Handle error while loading image
                        //         },
                        //       ),
                        //       Spacer(),
                        //     ],
                        //   ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
