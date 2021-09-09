import 'package:celebi_project/constants/lang/language_manager.dart';
import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/auth/change_password/change_password.dart';
import 'package:celebi_project/pages/auth/custom/custom_button.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/widgets/custom_alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: context.colors.primary,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
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
              Icons.lock, "Change Password", Icons.arrow_forward_ios_outlined,
              () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChangePasswordView(),
            ));
          }),
          buildDivider(),
          buildSettingsSections(
              Icons.language, "Language", Icons.arrow_forward_ios_outlined, () {
            showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                      height: context.height * 0.4,
                      width: context.width * 0.8,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Select Your Language",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(height: 90),
                          buildAllLanguages(
                              'icons/flags/png/tr.png', " Turkısh", () {
                            context
                                .setLocale(LanguageManager.instance.trLocale);
                          }),
                          buildLanguageDivider(),
                          buildAllLanguages(
                              'icons/flags/png/us.png', " English", () {
                            context
                                .setLocale(LanguageManager.instance.enLocale);
                          }),
                          buildLanguageDivider(),
                          buildAllLanguages(
                              'icons/flags/png/ru.png', " Russian", () {
                            context
                                .setLocale(LanguageManager.instance.ruLocale);
                          }),
                          buildLanguageDivider(),
                          buildAllLanguages('icons/flags/png/de.png', " German",
                              () {
                            context
                                .setLocale(LanguageManager.instance.deLocale);
                          }),
                          buildLanguageDivider(),
                          buildAllLanguages(
                              'icons/flags/png/bg.png', " Bulgarian", () {
                            context
                                .setLocale(LanguageManager.instance.bgLocale);
                          }),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: CustomButton(
                                onPressed: () => Navigator.of(context).pop(),
                                text: 'Ok'),
                          )
                        ],
                      ),
                    ));
          }),
          buildDivider(),
          buildSettingsSections(Icons.privacy_tip, "Privacy and Security",
              Icons.arrow_forward_ios_outlined, () {}),
        ],
      ),
    );
  }

  buildAllLanguages(String flagImage, String languageName, Function() onPress) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.asset(
              flagImage,
              package: 'country_icons',
              height: 40,
              width: 60,
            ),
          ),
          TextButton(
            onPressed: onPress,
            child: Text(
              languageName,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
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

Divider buildLanguageDivider() {
  return Divider(
    endIndent: 40,
    indent: 40,
    color: Colors.black54,
  );
}

Column buildSettingsSections(IconData leadingIcon, String title,
    IconData trailingIcon, VoidCallback onPressed) {
  return Column(
    children: [
      ListTile(
        onTap: onPressed,
        leading: Icon(leadingIcon),
        title: Text(title),
        trailing: Icon(trailingIcon),
      ),
    ],
  );
}
