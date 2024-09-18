import 'package:flutter/material.dart';
import 'package:flutter_application/controllers/auth_controller.dart';
import 'package:flutter_application/glabal_variable.dart';
import 'package:flutter_application/views/common_widget/subtitle_widget.dart';
import 'package:flutter_application/views/common_widget/title_widget.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    return SizedBox(
      height: 600,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: const SizedBox(
              height: 100, // Set the desired height
              child: Center(
                child: ListTile(
                  title: TitleWidget(title: 'My Account'),
                  subtitle: SubtitleWidget(title: 'name, address, city, state'),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_outline_outlined),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkblue,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox(
              height: 100, // Set the desired height
              child: Center(
                child: ListTile(
                  title: TitleWidget(title: 'Language'),
                  subtitle: SubtitleWidget(title: 'Used : English'),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.language),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkblue,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox(
              height: 100, // Set the desired height
              child: Center(
                child: ListTile(
                  title: TitleWidget(title: 'Change Password'),
                  subtitle: SubtitleWidget(title: 'OTP required'),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.lock_open_sharp),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkblue,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await authController.signOutUsers(context: context);
            },
            child: const SizedBox(
              height: 100, // Set the desired height
              child: Center(
                child: ListTile(
                  title: TitleWidget(title: 'Log out'),
                  subtitle: SubtitleWidget(title: 'Change user'),
                  leading: CircleAvatar(
                    
                    radius: 30,
                    child: Icon(Icons.logout),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: darkblue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
