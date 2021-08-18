import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/user_info_structure.dart';
import 'package:celebi_project/pages/login_screens/welcome_page/components/forget_password_button.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_white_button.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  _WecomeBackPageState createState() => _WecomeBackPageState();
}

class _WecomeBackPageState extends State<WelcomeBackPage> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildImage("asset/images/welcome_back.png"),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: buildUserInfoStructure(
                    context, Icons.markunread, 'Email or Username'),
              ),
              buildPasswordInfo(context),
              buildForgetPasswordButton(),
              buildContinueButton('Login'),
              Padding(
                padding: EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  SizedBox buildPasswordInfo(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFFB6DAE6)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFFEBF4F7),
        child: ListTile(
          leading: Icon(
            Icons.lock,
            color: Colors.teal[200],
          ),
          title: TextFormField(
            obscureText: isVisible ? false : true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBF4F7)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEBF4F7)),
              ),
              hintText: 'Password',
              hintStyle: context.textTheme.headline6!
                  .copyWith(color: Colors.grey, fontSize: 18),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
