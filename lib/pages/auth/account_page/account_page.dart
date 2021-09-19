import 'package:celebi_project/services/auth_service.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../main/bottom_nav_bar/bottom_nav_bar.dart';
import '../../main/profile_edit/profile_edit_view.dart';
import '../../main/settings_page/settings_page_view.dart';
import 'package:flutter/material.dart';

import 'components/settings_divider.dart';
import 'components/settings_element.dart';

import 'package:url_launcher/url_launcher.dart';


class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late String username;

  bool nameGet = false;

  late User currentUser;

  String profilePicUrl = '';

  bool profilePicget = false;

  Future<void> getProfilePic() async {
    profilePicUrl = await FirestoreService().getProfilePicture();
    profilePicget = true;
    setState(() {});
  }

  Future<void> getusername() async {
    username = await FirestoreService().getCurrentUsersUsername();
    currentUser = (AuthService().getCurrentUser())!;
    nameGet = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getusername().then((value) => getProfilePic());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBarMethod(context),
      body: SafeArea(
        child: nameGet
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(profilePicUrl),
                            radius: 24,
                          ),
                          title: Text('$username'),
                          subtitle: Text('${currentUser.email}'),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right)),
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            SettingsElement(
                                name: 'Edit Profile',
                                icon: Icons.person,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileEditView(),
                                  ));
                                }),
                            SettingsDivider(),
                            SettingsElement(
                                name: 'Settings',
                                icon: Icons.settings,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SettingsPage(),
                                  ));
                                }),
                          ],
                        )),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            SettingsElement(
                                name: 'Invite your friends',
                                icon: Icons.person,
                                onPressed: () {}),
                            SettingsDivider(),
                            SettingsElement(
                                name: 'privacy Policy',
                                icon: Icons.language,
                                onPressed: () async {
                                  await launch('https://sites.google.com/view/celebi/ana-sayfa');
                                }),
                            SettingsDivider(),
                            SettingsElement(
                                name: 'Terms of Use',
                                icon: Icons.settings,
                                onPressed: () {}),
                            SettingsDivider(),
                            SettingsElement(
                                name: 'Help',
                                icon: Icons.question_answer,
                                onPressed: () {}),
                          ],
                        ))
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
