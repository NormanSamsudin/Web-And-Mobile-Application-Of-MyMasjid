import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/mosque_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PdfWidget extends ConsumerStatefulWidget {
  const PdfWidget({super.key});

  @override
  _PdfWidgetState createState() => _PdfWidgetState();
}

class _PdfWidgetState extends ConsumerState<PdfWidget> {
  File? _pdfFile; // Cached PDF file
  bool _isLoading = true; // Loading state
  String? _error; // Error state
  late PageController _pageController;
  int _currentPage = 0;
  int _totalPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController
    _loadPdf();
  }

  // Method to load the PDF, this will only be called once
  void _loadPdf() async {
    final mosqueController = MosqueController();
    try {
      String? mosqueId = await mosqueController.getMosqueId();

      if (mosqueId != null) {
        String pdfUrl = 'http://10.0.2.2:3000/public/pdf/$mosqueId.pdf';
        File? pdfFile = await _downloadPdf(pdfUrl);
        if (pdfFile != null) {
          setState(() {
            _pdfFile = pdfFile;
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _error = 'No mosque ID found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error loading PDF';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Text(_error!),
      );
    }

    if (_pdfFile == null) {
      return const Center(
        child: Text('No PDF found'),
      );
    }

    // Once the PDF is downloaded, display it
    return Column(
      children: [
        SizedBox(
          height: 550,
          child: Expanded(
            child: PDFView(
              filePath: _pdfFile!.path,
              enableSwipe: true, // Enables swiping between pages
              swipeHorizontal: true, // Allows horizontal scrolling for pages
              autoSpacing: true, // Adds space between pages automatically
              pageFling: true, // Makes page snapping feel smoother
              onRender: (pages) {
                _totalPage = pages!; // Set total page count
              },
              onPageChanged: (page, total) {
                setState(() {
                  _currentPage = page! -
                      1; // Adjust page index (PDFView starts counting at 1)
                });
              },
            ),
          ),
        ),

        // Display current page / total pages
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Page ${_currentPage + 2} of $_totalPage', // Shows the current page and total pages
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

      ],
    );
  }

  // Method to download the PDF from the URL and store it locally
  Future<File?> _downloadPdf(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      var dir = await getTemporaryDirectory();
      File file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(response.bodyBytes, flush: true);
      return file;
    } catch (e) {
      print('Error downloading PDF: $e');
      return null;
    }
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_application/controllers/mosque_controller.dart';
// import 'package:flutter_application/glabal_variable.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class PdfWidget extends ConsumerStatefulWidget {
//   const PdfWidget({super.key});

//   @override
//   _PdfWidgetState createState() => _PdfWidgetState();
// }

// class _PdfWidgetState extends ConsumerState<PdfWidget> {
//   File? _pdfFile; // Cached PDF file
//   bool _isLoading = true; // Loading state
//   String? _error; // Error state
//   late PageController _pageController;
//   int _currentPage = 0;
//   int _totalPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(); // Initialize the PageController
//     _loadPdf();
//   }

//   // Method to load the PDF, this will only be called once
//   void _loadPdf() async {
//     final mosqueController = MosqueController();
//     try {
//       String? mosqueId = await mosqueController.getMosqueId();

//       if (mosqueId != null) {
//         String pdfUrl = 'http://10.0.2.2:3000/public/pdf/$mosqueId.pdf';
//         File? pdfFile = await _downloadPdf(pdfUrl);
//         if (pdfFile != null) {
//           setState(() {
//             _pdfFile = pdfFile;
//             _isLoading = false;
//           });
//         }
//       } else {
//         setState(() {
//           _error = 'No mosque ID found';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _error = 'Error loading PDF';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     if (_error != null) {
//       return Center(
//         child: Text(_error!),
//       );
//     }

//     if (_pdfFile == null) {
//       return const Center(
//         child: Text('No PDF found'),
//       );
//     }

//     // Once the PDF is downloaded, display it
//     return Column(
//       children: [
//         SizedBox(
//           height: 550,
//           child: Expanded(
//             child: PDFView(
//               filePath: _pdfFile!.path,
//               enableSwipe: true, // Enables swiping between pages
//               swipeHorizontal: true, // Allows horizontal scrolling for pages
//               autoSpacing: true, // Adds space between pages automatically
//               pageFling: true, // Makes page snapping feel smoother
//               onRender: (pages) {
//                 _totalPage = pages!;
//               },
//               onPageChanged: (page, total) {
//                 setState(() {
//                   _currentPage = page!;
//                 });
//                 _pageController.jumpToPage(_currentPage);
//               },
//               // onPageChanged: (page, total) {
//               //   _pageController.jumpToPage(_currentPage);
//               //   setState(() {
//               //     debugPrint(page.toString());
//               //     _currentPage = page!;
//               //     _pageController.jumpToPage(_currentPage);
//               //   });

//               //   _pageController.jumpToPage(_currentPage);
//               // },
//             ),
//           ),
//         ),
//         SmoothPageIndicator(
//           controller: _pageController,
//           count: _totalPage,
//           effect: const ExpandingDotsEffect(
//             dotColor: Colors.grey, // Unselected dot color
//             activeDotColor: darkblue, // Selected dot color
//             dotHeight: 10,
//             dotWidth: 10,
//           ),
//         ),
//       ],
//     );
//   }

//   // Method to download the PDF from the URL and store it locally
//   Future<File?> _downloadPdf(String url) async {
//     try {
//       var response = await http.get(Uri.parse(url));
//       var dir = await getTemporaryDirectory();
//       File file = File('${dir.path}/temp.pdf');
//       await file.writeAsBytes(response.bodyBytes, flush: true);
//       return file;
//     } catch (e) {
//       print('Error downloading PDF: $e');
//       return null;
//     }
//   }
// }


// class PdfWidget extends ConsumerStatefulWidget {
//   const PdfWidget({super.key});

//   @override
//   _PdfWidgetState createState() => _PdfWidgetState();
// }

// class _PdfWidgetState extends ConsumerState<PdfWidget> {

//   @override
//   Widget build(BuildContext context) {
//     final mosqueController = MosqueController();
//     final PageController _pageController = PageController();
//       int _currentPage = 0;

//     return FutureBuilder<String?>(
//       future: mosqueController.getMosqueId(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return const Center(
//             child: Text('Error fetching mosque ID'),
//           );
//         } else if (!snapshot.hasData || snapshot.data == null) {
//           return const Center(
//             child: Text('No mosque ID found'),
//           );
//         }

//         // Use the mosque ID to build the PDF URL
//         String mosqueId = snapshot.data!;
//         String pdfUrl = 'http://10.0.2.2:3000/public/pdf/$mosqueId.pdf';

//         return FutureBuilder<File?>(
//           future: _downloadPdf(pdfUrl),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.hasError) {
//               return const Center(
//                 child: Text('Error downloading PDF'),
//               );
//             } else if (!snapshot.hasData || snapshot.data == null) {
//               return const Center(
//                 child: Text('No PDF found'),
//               );
//             }

//             // Once the PDF is downloaded, display it
//             return Column(
//               children: [
//                 Container(
//                   height: 550,
//                   child: Expanded(
//                     child: PDFView(
//                       filePath: snapshot.data!.path,
//                       enableSwipe: true, // Enables swiping between pages
//                       swipeHorizontal: true, // Allows horizontal scrolling for pages
//                       autoSpacing: true, // Adds space between pages automatically
//                       pageFling: true, // Makes page snapping feel smoother
//                       onPageChanged: (page, total) {
//                         setState(() {
//                           _currentPage = page!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 SmoothPageIndicator(
//                   controller: _pageController,
//                   count: 13,
//                   effect: const ExpandingDotsEffect(
//                     dotColor: Colors.grey, // Unselected dot color
//                     activeDotColor: darkblue, // Selected dot color
//                     dotHeight: 10,
//                     dotWidth: 10,
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   // Method to download the PDF from the URL and store it locally
//   Future<File?> _downloadPdf(String url) async {
//     try {
//       var response = await http.get(Uri.parse(url));
//       var dir = await getTemporaryDirectory();
//       File file = File('${dir.path}/temp.pdf');
//       await file.writeAsBytes(response.bodyBytes, flush: true);
//       return file;
//     } catch (e) {
//       print('Error downloading PDF: $e');
//       return null;
//     }
//   }
  

// }
