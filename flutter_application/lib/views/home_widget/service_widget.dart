import 'package:flutter/material.dart';
import 'package:flutter_application/views/common_widget/title_feature.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/views/screens/detail_secreen/qr_screen.dart';
import 'package:icons_plus/icons_plus.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Review',
      'Sadaqah',
      'Activity',
      'Item Lost',
      'Qorban',
      'Volunteer',
      'About',
      'Contact'
    ];

    final List<Icon> icons = [
      const Icon(EvaIcons.message_square),
      const Icon(ZondIcons.currency_dollar),
      const Icon(Icons.event),
      const Icon(EvaIcons.search_outline),
      const Icon(MingCute.knife_line),
      const Icon(OctIcons.copilot),
      //const Icon(Icons.volunteer_activism),
      const Icon(Icons.info),
      const Icon(Icons.contact_phone),
    ];

    final List<Widget> _pages = [
      const QrScreen(),
      const QrScreen(),
      const QrScreen(),
      const QrScreen(),
      const QrScreen(),
      const QrScreen(),
      const QrScreen(),
      const QrScreen()
    ];

    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: SizedBox(
        height: 300,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 14.0,
            childAspectRatio: 2.3 / 2.7,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GridTile(
              child: InkWell(
                child: SizedBox(
                  height: 200,
                  width: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 65,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.outer,
                                  color: Color.fromARGB(255, 0, 79, 116),
                                  spreadRadius: 0.5,
                                  offset: Offset(1, 1))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: darkblue,
                            foregroundColor: darkblue,
                            child: Icon(
                              icons[index]
                                  .icon, // Use the icon data from your list
                              color: const Color.fromARGB(255, 230, 230, 230),
                              size: 25, // Adjust icon size as needed
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 58,
                          height: 24,
                          child: TitleFeatureWidget(title: items[index]))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _pages[index],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
