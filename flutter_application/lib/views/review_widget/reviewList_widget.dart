import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/models/review.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';

class ReviewlistWidget extends StatelessWidget {
  ReviewlistWidget({super.key});

  Review review1 = Review(
    userId: "user1",
    message: "Great product!",
    rating: "5",
    date: "2024-09-18",
    imageUrl: "http://example.com/image1.png",
  );

  Review review2 = Review(
    userId: "user2",
    message: "Satisfactory service.",
    rating: "4",
    date: "2024-09-17",
    imageUrl: "http://example.com/image2.png",
  );

  Review review3 = Review(
    userId: "user3",
    message: "Could be improved.",
    rating: "3",
    date: "2024-09-16",
    imageUrl: "http://example.com/image3.png",
  );

  // Add them to a List<Review>

  // @override
  // Widget build(BuildContext context) {
  //   final List<Review> reviews = [review1, review2, review3];

  //   return SizedBox(
  //     height: 600,
  //     child: ListView(
  //       padding: const EdgeInsets.all(8),
  //       children: <Widget>[
  //         InkWell(
  //           onTap: () {},
  //           child: const SizedBox(
  //             height: 100, // Set the desired height
  //             child: Center(
  //               child: ListTile(
  //                 title: TitleWidget(title: 'My Account'),
  //                 subtitle: SubtitleWidget(title: 'name, address, city, state'),
  //                 leading: CircleAvatar(
  //                   radius: 30,
  //                   child: Icon(Icons.person_outline_outlined),
  //                 ),
  //                 trailing: Icon(
  //                   Icons.arrow_forward_ios_rounded,
  //                   color: darkblue,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),

  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final List<Review> reviews = [review1, review2, review3];
    return SizedBox(
      height: 600,
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
                  return Dialog(
                    child: InteractiveViewer(
                      panEnabled:
                          false, // Can be set to false to disable panning
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.network(
                        'http://192.168.0.6:3000/public/img/qr/66ea2d0f948e462d23821a23.png',
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
                title: Text(review.userId), // Use Review userId as the title
                subtitle: Text('${review.message}\nRating: ${review.rating}'),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(review.imageUrl), // Load user's image
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
                              'http://192.168.0.6:3000/public/img/qr/66ea2d0f948e462d23821a23.png',
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
      ),
    );
  }
}
