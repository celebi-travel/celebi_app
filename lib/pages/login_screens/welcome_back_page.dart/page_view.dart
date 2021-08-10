import 'package:celebi_project/pages/login_screens/continue_button.dart';
import 'package:celebi_project/pages/login_screens/welcome_back_page.dart/components/forget_password_button.dart';
import 'package:celebi_project/pages/login_screens/welcome_back_page.dart/components/user_info_structure.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class WecomeBackPage extends StatefulWidget {
  const WecomeBackPage({Key? key}) : super(key: key);

  @override
  _WecomeBackPageState createState() => _WecomeBackPageState();
}

class _WecomeBackPageState extends State<WecomeBackPage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Image.asset(
                  "asset/images/welcome_back.png",
                  width: double.infinity,
                ),
              ],
            ),
            Column(children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: buildUserInfoStructure(
                    context, Icons.markunread, 'Email or Username'),
              ),
              buildPasswordInfo(context),
              buildForgetPasswordButton(),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: buildContinueButton('Login'),
              )
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
