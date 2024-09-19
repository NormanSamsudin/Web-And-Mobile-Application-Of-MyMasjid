// import 'package:flutter/material.dart';
// import 'package:flutter_application/controllers/activity_controller.dart';
// import 'package:flutter_application/controllers/lost_controller.dart';
// import 'package:flutter_application/models/activity.dart';
// import 'package:flutter_application/models/lost.dart';
// import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
// import 'package:flutter_application/views/common_widget/title_widget.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ListWidget extends StatefulWidget {
//   @override
//   State<ListWidget> createState() => _ReviewlistWidgetState();
// }

// class _ReviewlistWidgetState extends State<ListWidget> {
//   late Future<List<LostModel>> futureActivity;

//   @override
//   void initState() {
//     super.initState();
//     futureActivity = LostController().loadLostItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 693,
//       child: FutureBuilder(
//           future: futureActivity,
//           builder: (constext, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text("Error: ${snapshot.error}"),
//               );
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(
//                 child: Text('No Activity'),
//               );
//             } else {
//               return Container(
//                 height: 700,
//                 child: FutureBuilder(
//                   future: futureActivity,
//                   builder: (constext, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text("Error: ${snapshot.error}"),
//                       );
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return const Center(
//                         child: Text('No Activity'),
//                       );
//                     } else {
//                       final activities = snapshot.data!;

//                       return ListView.builder(
//                         padding: const EdgeInsets.only(
//                             left: 20, right: 20, top: 20, bottom: 20),
//                         itemCount: activities.length,
//                         itemBuilder: (constext, index) {
//                           final activity = activities[index];
//                           return Card(
//                             color: Colors.white,
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: TitleWidget(
//                                     title: activity.status,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 200,
//                                   child: Image.network(
//                                     activity.imageUrl,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               );
//             }
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/lost_controller.dart';
import 'package:flutter_application/models/lost.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart'; // Ensure you have the VerticalCardPager package imported

class ListWidget extends StatefulWidget {
  @override
  State<ListWidget> createState() => _ReviewlistWidgetState();
}

class _ReviewlistWidgetState extends State<ListWidget> {
  late Future<List<LostModel>> futureLostItems;

  @override
  void initState() {
    super.initState();
    futureLostItems = LostController().loadLostItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LostModel>>(
        future: futureLostItems,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Lost Items'),
            );
          } else {
            // Extract the data
            final lostItems = snapshot.data!;

            // Map the data to the titles and images required by VerticalCardPager
            final titles = lostItems.map((item) => item.status).toList();
            final images = lostItems.map((item) {
              return SizedBox(
                height: 500,
                child: ClipRRect(
                  
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList();

            return  SizedBox(
              height: 603,
              child: VerticalCardPager(
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
                            lostItems[index].imageUrl, // Show the zoomed image
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
                initialPage: 0,
                align: ALIGN.CENTER,
                physics: const ClampingScrollPhysics(),
              ),
            );
          }
        },
      
    );
  }
}
