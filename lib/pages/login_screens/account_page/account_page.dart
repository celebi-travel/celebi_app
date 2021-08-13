import 'package:flutter/material.dart';

import 'components/settings_divider.dart';
import 'components/settings_element.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150),
              Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.asset('asset/images/salma.png'),
                      radius: 24,
                    ),
                    title: Text('Jennifer Salma'),
                    subtitle: Text('salma@gmail.com'),
                    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right)),
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      SettingsElement(name: 'Edit Profile', icon: Icons.person, onPressed: () {}),
                      SettingsDivider(),
                      SettingsElement(name: 'Language', icon: Icons.language, onPressed: () {}),
                      SettingsDivider(),
                      SettingsElement(name: 'Settings', icon: Icons.settings, onPressed: () {}),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      SettingsElement(name: 'Invite your friends', icon: Icons.person, onPressed: () {}),
                      SettingsDivider(),
                      SettingsElement(name: 'privacy Policy', icon: Icons.language, onPressed: () {}),
                      SettingsDivider(),
                      SettingsElement(name: 'Terms of Use', icon: Icons.settings, onPressed: () {}),
                      SettingsDivider(),
                      SettingsElement(name: 'Help', icon: Icons.question_answer, onPressed: () {}),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
