import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/about_controller.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/controllers/review_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/models/about.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/views/common_widget/bodySubText_widget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';

class AboutlistWidget extends StatefulWidget {
  AboutlistWidget({super.key});

  @override
  State<AboutlistWidget> createState() => _AboutlistWidgetState();
}

class _AboutlistWidgetState extends State<AboutlistWidget> {
  late Future<List<AboutModel>> futureAbouts;

  @override
  void initState() {
    super.initState();
    futureAbouts = AboutController().loadAbouts();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: FutureBuilder(
          future: futureAbouts,
          builder: (constext, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Abouts'),
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
                            review.fullName), // Use About userId as the title
                        subtitle: BodySubTextWidget(
                            title:
                                '${review.position}  : ${review.contact}'),
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
