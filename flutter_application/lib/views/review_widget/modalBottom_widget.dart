// import 'package:flutter/material.dart';
// import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
// import 'package:flutter_application/views/common_widget/title_widget.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class ModalBottomWidget extends StatefulWidget {
//   const ModalBottomWidget({super.key});

//   @override
//   _ModalBottomWidgetState createState() => _ModalBottomWidgetState();
// }

// class _ModalBottomWidgetState extends State<ModalBottomWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _reviewController = TextEditingController();
//   double _rating = 0.0; // Variable to hold the star rating

//   // Function to handle form submission
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       String review = _reviewController.text;
//       print("Review Submitted: $review");
//       print("Rating: $_rating");
//       // Clear the text field after submission
//       _reviewController.clear();
//       // Show confirmation (can also use other methods)
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Review submitted successfully!')),
//       );
//       // Optionally close the modal after submission
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(16),
//       height: 400, // Increased height for the form
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TitleWidget(
//               title: "Write Your Review",
//             ),
//             SizedBox(height: 10),

//             Container(
//               child: TextFormField(
//                 controller: _reviewController,
//                 maxLines: 3, // Allow for as many lines as needed
//                 keyboardType: TextInputType.multiline,
//                 decoration: InputDecoration(
//                   hintText: 'Enter your review here',
//                   border: InputBorder.none, // Removes the border
//                   filled: true, // Optional: fill the text field with a color
//                   fillColor: Colors.grey[200], // Optional: background color
//                 ),
//                 // Validator to ensure the text box isn't empty
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your review';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             const SubtitleWidget(
//               title: 'Rate your experience:',
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: RatingBar.builder(
//                 itemSize: 30,
//                 initialRating: 0,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   setState(() {
//                     _rating = rating; // Update the rating variable
//                   });
//                 },
//               ),
//             ),
//             const Spacer(),
//             // Submit button
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         _submitForm();
//                       },
//                       child: Text('Submit Review'),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text('Close'),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io'; // Import for File

class ModalBottomWidget extends StatefulWidget {
  const ModalBottomWidget({super.key});

  @override
  _ModalBottomWidgetState createState() => _ModalBottomWidgetState();
}

class _ModalBottomWidgetState extends State<ModalBottomWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;
  dynamic _image;

  // Function to handle image selection
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String review = _reviewController.text;
      print("Review Submitted: $review");
      print("Rating: $_rating");
      if (_image != null) {
        print("Image path: ${_image!.path}"); // Use the image path as needed
      }
      // Clear the text field after submission
      _reviewController.clear();
      setState(() {
        _image = null; // Clear the selected image after submission
      });
      // Show confirmation (can also use other methods)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Review submitted successfully!')),
      );
      // Optionally close the modal after submission
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      height: 400, // Increased height for the form
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleWidget(
              title: "Write Your Review",
            ),
            SizedBox(height: 10),

            Container(
              child: TextFormField(
                controller: _reviewController,
                maxLines: 3, // Allow for as many lines as needed
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your review here',
                  border: InputBorder.none, // Removes the border
                  filled: true, // Optional: fill the text field with a color
                  fillColor: Colors.grey[200], // Optional: background color
                ),
                // Validator to ensure the text box isn't empty
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            const SubtitleWidget(
              title: 'Rate your experience:',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: RatingBar.builder(
                itemSize: 30,
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating; // Update the rating variable
                  });
                },
              ),
            ),
            SizedBox(height: 10), // Add some space
            // Image selection button
            ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: const Text('Pick an Image'),
            ),
            if (_image != null) // Display the selected image if available
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            const Spacer(),
            // Submit button
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Spread buttons across the row
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      child: Text('Submit Review'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add some space between the buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
