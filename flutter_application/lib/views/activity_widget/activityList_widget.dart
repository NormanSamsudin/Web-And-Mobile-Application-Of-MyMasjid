import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/activity_controller.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/controllers/review_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/models/activity.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/views/common_widget/bodySubText_widget.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class ActivitylistWidget extends StatefulWidget {
  ActivitylistWidget({super.key});

  @override
  State<ActivitylistWidget> createState() => _ReviewlistWidgetState();
}

class _ReviewlistWidgetState extends State<ActivitylistWidget> {
  late Future<List<ActivityModel>> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = ActivityController().loadActivity();
  }

  @override
  Widget build(BuildContext context) {
    //final List<ReviewModel> reviews = [review1, review2, review3];
    return SizedBox(
      height: 600,
      child: FutureBuilder(
          future: futureActivity,
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
              // final activity = snapshot.data!;

              // return ListView.builder(
              //   padding: const EdgeInsets.all(8),
              //   itemCount: activity.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     final review = activity[index];
              //     return InkWell(
              //       onTap: () {
              //         showDialog(
              //           context: context,
              //           builder: (BuildContext context) {
              //             return Dialog(
              //               child: InteractiveViewer(
              //                 panEnabled:
              //                     false, // Can be set to false to disable panning
              //                 boundaryMargin: const EdgeInsets.all(20),
              //                 minScale: 0.5,
              //                 maxScale: 4.0,
              //                 child: Image.network(
              //                   review.imageUrl,
              //                   fit: BoxFit.contain,
              //                 ),
              //               ),
              //             );
              //           },
              //         );
              //       },
              //       child: SizedBox(
              //         height: 100,
              //         child: ListTile(
              //           title: Text(
              //               review.userId), // Use Review userId as the title
              //           subtitle: BodySubTextWidget(
              //               title:
              //                   '${review.id}'),
              //           leading: CircleAvatar(
              //             radius: 30,
              //             backgroundImage: NetworkImage(
              //                 review.imageUrl), // Load user's image
              //             onBackgroundImageError: (_, __) {
              //               // Handle error while loading image
              //             },
              //           ),
              //           trailing: InkWell(
              //             onTap: () {
              //               showDialog(
              //                 context: context,
              //                 builder: (BuildContext context) {
              //                   return Dialog(
              //                     child: InteractiveViewer(
              //                       panEnabled:
              //                           false, // Can be set to false to disable panning
              //                       boundaryMargin: const EdgeInsets.all(20),
              //                       minScale: 0.5,
              //                       maxScale: 4.0,
              //                       child: Image.network(
              //                         review.imageUrl,
              //                         fit: BoxFit.contain,
              //                       ),
              //                     ),
              //                   );
              //                 },
              //               );
              //             },
              //             child: const Icon(
              //               Icons.info,
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // );
               // Map the activity data to the titles and images required by VerticalCardPager
              final activities = snapshot.data!;
              final titles =
                  activities.map((activity) => activity.programName).toList();
              final images = activities.map((activity) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    activity.imageUrl, // Load the image URL from the API
                    fit: BoxFit.cover,
                  ),
                );
              }).toList();

              return VerticalCardPager(
                titles: titles,
                images: images,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onPageChanged: (page) {
                  // Optional: Handle page change
                },
                onSelectedItem: (index) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: InteractiveViewer(
                          panEnabled: false,
                          boundaryMargin: const EdgeInsets.all(20),
                          minScale: 0.5,
                          maxScale: 4.0,
                          child: Image.network(
                            activities[index].imageUrl, // Show the zoomed image
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                },
                initialPage: 0,
                align: ALIGN.CENTER,
                physics: const ClampingScrollPhysics(),
              );
            }
          }),
    );
  }
}
