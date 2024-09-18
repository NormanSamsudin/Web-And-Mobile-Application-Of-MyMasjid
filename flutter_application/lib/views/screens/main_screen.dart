import 'package:flutter/material.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/views/screens/nav_screens/account_screen.dart';
import 'package:flutter_application/views/screens/nav_screens/setting_screen.dart';
import 'package:flutter_application/views/screens/nav_screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 1;
  final List<Widget> _pages = [SettingScreen(), HomeScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          iconSize: 30,
          selectedItemColor: darkblue,
          unselectedItemColor: Colors.grey,
          currentIndex: _pageIndex,
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.lato(
              fontSize: 14.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          unselectedLabelStyle: GoogleFonts.lato(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.5),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  weight: 0.05,
                  color: _pageIndex == 0
                      ? darkblue
                      : const Color.fromARGB(123, 158, 158, 158),
                ),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  weight: 0.05,
                  color: _pageIndex == 1
                      ? darkblue
                      : const Color.fromARGB(123, 158, 158, 158),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  weight: 0.05,
                  color: _pageIndex == 2
                      ? darkblue
                      : const Color.fromARGB(123, 158, 158, 158),
                ),
                label: "Account"),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
