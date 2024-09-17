import 'dart:ui';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/controllers/user_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String userFullName = 'User'; // Variable to hold the full name

  void loadUserFullName() async {
    String fullName = await UserController()
        .getUserFullname(); // Await the result from getUserFullname()
    setState(() {
      userFullName =
          fullName; // Update the state to reflect the user's full name
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserFullName();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/bluepattern.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              fit: BoxFit.cover,
              //opacity: ,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            color:
                Colors.black.withOpacity(0.2), // Adjust the opacity as needed
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), // Blur effect
            child: Container(
              color: Colors.black
                  .withOpacity(0), // Transparent color to retain blur
            ),
          ),
          Positioned(
            left: 30,
            top: 70,
            child: SizedBox(
                //width: 250,
                //height: 50,
                child: Row(
              children: [
                const CircleAvatar(
                  foregroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    'assets/images/MyMasjid.jpg',
                  ), // Set the image
                  backgroundColor: Colors.transparent,
                  radius: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assalammualaikum,',
                      style: montserratTitle,
                    ),
                    Text(
                      '${userFullName[0].toUpperCase()}${userFullName.substring(1).toLowerCase()}',
                      style: montserratTitle,
                    ),
                  ],
                ),
              ],
            )),
          ),
          // Positioned(
          //     left: 311,
          //     top: 78,
          //     child: Material(
          //       type: MaterialType.transparency,
          //       child: InkWell(
          //         onTap: () {},
          //         // overlayColor: MaterialStateProperty.all(Color(0x0C7F7F)),
          //         child: Ink(
          //           width: 31,
          //           height: 31,
          //           decoration: const BoxDecoration(
          //               image: DecorationImage(
          //                   image: AssetImage('assets/icons/bell.png'))),
          //         ),
          //       ),
          //     )),
          // Positioned(
          //   left: 354,
          //   top: 78,
          //   child: Material(
          //     child: InkWell(
          //       onTap: () {},
          //       child: Ink(
          //         width: 31,
          //         height: 31,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //               image: AssetImage('assets/icons/message.png')),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}