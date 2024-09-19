import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/controllers/review_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/views/common_widget/bodySubText_widget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';

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
                      height: 100,
                      child: ListTile(
                        title: Text(
                            review.userId), // Use Review userId as the title
                        subtitle:
                            BodySubTextWidget(title: '${review.message}\nRating: ${review.rating}'),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              review.imageUrl), // Load user's image
                          onBackgroundImageError: (_, __) {
                            // Handle error while loading image
                          },
                        ),
                        trailing: InkWell(
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
                          child: const Icon(
                            Icons.info,
                            color: Colors.grey,
                          ),
                        ),
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
