import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarMethod(context),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Text("Back", style: TextStyle(color: Colors.black))),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings",
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 20),
              child: accountIconAndTitle(),
            ),
            buildSettingsInfo(),
            SizedBox(height: 150),
            logOutInfo(),
          ],
        ),
      ),
    );
  }

  SizedBox logOutInfo() {
    return SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF6AADA4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
          child: Row(
            children: [
              SizedBox(width: 90),
              Icon(
                Icons.note,
                color: Colors.green,
              ),
              SizedBox(width: 20),
              Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ));
  }

  Row accountIconAndTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.ac_unit,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(width: 30),
        Text(
          "Account",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container buildSettingsInfo() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFE9E9E9),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      width: 600,
      height: 180,
      child: Column(
        children: [
          buildSettingsSections(
              Icons.verified_user, "Change Password", Icons.verified_user),
          buildDivider(),
          buildSettingsSections(
              Icons.verified_user, "Language", Icons.verified_user),
          buildDivider(),
          buildSettingsSections(
              Icons.verified_user, "Privacy and Security", Icons.verified_user),
        ],
      ),
    );
  }

  Padding buildDivider() {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Divider(
        height: 3,
        color: Colors.black,
      ),
    );
  }

  Column buildSettingsSections(
      IconData leadingIcon, String title, IconData trailingIcon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(leadingIcon),
          title: Text(title),
          trailing: Icon(trailingIcon),
        ),
      ],
    );
  }
}
