import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/activity_controller.dart';
import 'package:flutter_application/models/activity.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class ActivitylistWidget extends StatefulWidget {
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
    return Container(
      height: 649,
      child: FutureBuilder(
          future: futureActivity,
          builder: (constext, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Activity'),
              );
            } else {
              return Container(
                height: 700,
                child: FutureBuilder(
                  future: futureActivity,
                  builder: (constext, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No Activity'),
                      );
                    } else {
                      final activities = snapshot.data!;

                      return ListView.builder(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        itemCount: activities.length,
                        itemBuilder: (constext, index) {
                          final activity = activities[index];
                          return Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  title: TitleWidget(
                                    title: activity.programName,
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(91, 37, 36, 36),
                                  height: 25,
                                  thickness: 0.75,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: Image.network(
                                    activity.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Divider(
                                  color: Color.fromARGB(91, 37, 36, 36),
                                  height: 25,
                                  thickness: 0.75,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                ListTile(
                                  subtitle: SubtitleWidget(
                                    title:
                                        '${activity.speaker} \n${activity.createdAt}',
                                  ),
                                  trailing: Material(
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                      hoverColor: Colors.orange,
                                      splashColor: Colors.red,
                                      focusColor: Colors.yellow,
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        width: 110,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 8,
                                              top: 5,
                                              bottom: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Attend',
                                                style: GoogleFonts.getFont(
                                                  'Rubik',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              const Icon(
                                                Icons.person,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              );
            }
          }),
    );
  }
}
