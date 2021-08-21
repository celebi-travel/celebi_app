import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.width * 0.30,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(180),
                          child: Image.asset('asset/images/profile2.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          color: Colors.white,
                          icon: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(Icons.camera_alt_rounded,
                                color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Azad Erdoğan',
                  style: context.textTheme.headline6!
                      .copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ProfileItem(
                    leadingIcon: Icons.person,
                    text: 'Edit Profile',
                    onPressed: () {},
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  ProfileItem(
                    leadingIcon: Icons.settings,
                    text: 'Settings',
                    onPressed: () {},
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  ProfileItem(
                    leadingIcon: Icons.person_add,
                    text: 'Invite Your Friends',
                    onPressed: () {},
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  ProfileItem(
                    leadingIcon: Icons.help,
                    text: 'Help',
                    onPressed: () {},
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: Text('Logout?'),
                            content: buildAlertContent(),
                          ),
                        );
                      },
                      text: 'Log Out',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildAlertContent() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Dou your accept?',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        Spacer(flex: 5),
        AlertDialogButton(
          backgroundColor: Colors.white,
          text: 'YES',
          textColor: Color(0xFF6AADA4),
          onPressed: () {},
        ),
        Spacer(),
        AlertDialogButton(
          backgroundColor: Color(0xFF6AADA4),
          text: 'NO',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}

class AlertDialogButton extends StatelessWidget {
  const AlertDialogButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 30,
            width: 130,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0.5,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(backgroundColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
              child: Text(
                '$text',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            )));
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.leadingIcon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final IconData leadingIcon;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.green[100], borderRadius: BorderRadius.circular(5)),
          child: Icon(
            leadingIcon,
            color: Colors.green,
            size: 20,
          )),
      title: Text('$text'),
      trailing: Icon(
        Icons.arrow_forward,
      ),
    );
  }
}
