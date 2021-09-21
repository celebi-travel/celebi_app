import 'package:celebi_project/services/auth_service.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:celebi_project/services/translator.dart';
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
                      margin: EdgeInsets.only(right: 30, left: 30, top: 60),
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
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            SettingsElement(
                                name: languagesMap[TranslatorManager.instance
                                    .getLocale(context)]['editprofile'],
                                icon: Icons.person,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileEditView(),
                                  ));
                                }),
                            SettingsDivider(),
                            SettingsElement(
                                name: languagesMap[TranslatorManager.instance
                                    .getLocale(context)]['settings'],
                                icon: Icons.settings,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SettingsPage(),
                                  ));
                                }),
                            SettingsDivider(),
                            SettingsElement(
                                name: languagesMap[TranslatorManager.instance
                                    .getLocale(context)]['privacypolicy'],
                                icon: Icons.language,
                                onPressed: () async {
                                  await launch(
                                      'https://sites.google.com/view/celebi/ana-sayfa');
                                }),
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
