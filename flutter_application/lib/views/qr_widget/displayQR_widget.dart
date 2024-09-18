// import 'package:flutter/material.dart';

// class DisplayQrWidget extends StatelessWidget {
//   const DisplayQrWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Image.network(
//         'http://10.0.2.2:3000/public/img/qr/66ea2d0f948e462d23821a23.png', // Adjust URL for Android emulator
//         errorBuilder: (context, error, stackTrace) {
//           return const Text('Could not load image');
//         },
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) {
//             return child;
//           }
//           return Center(
//             child: CircularProgressIndicator(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                       loadingProgress.expectedTotalBytes!
//                   : null,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/mosque_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 

class DisplayQrWidget extends ConsumerWidget {
  const DisplayQrWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mosqueController = MosqueController();

    return FutureBuilder<String?>(
      future: mosqueController
          .getMosqueId(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child:
                CircularProgressIndicator(), // Show loading indicator while fetching mosque ID
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error fetching mosque ID'),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Text('No mosque ID found'),
          );
        }

        // Use the mosque ID as the file name in the image URL
        String mosqueId = snapshot.data!;
        String imageUrl = 'http://10.0.2.2:3000/public/img/qr/$mosqueId.png';

        return Center(
          child: Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) {
              return const Text('Could not load image');
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
