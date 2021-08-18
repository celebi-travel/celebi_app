import 'package:celebi_project/pages/login_screens/check_email/check_email.dart';
import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_blue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/user_info_structure.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildForgetPasswordImage(
                "asset/images/forget_password.png",
              ),
              Text(
                'Forget Password',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Enter your registered email below to receive\t\t password reset instruction',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: buildUserInfoStructure(
                      context, Icons.markunread, "Email")),
              buildContinueButton('Send', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckEmailView()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
