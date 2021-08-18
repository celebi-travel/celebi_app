import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_white_button.dart';
import 'package:celebi_project/pages/login_screens/custom/user_info_structure.dart';
import 'package:celebi_project/pages/login_screens/forget_password/forget_pass_view.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterToContuniState createState() => _RegisterToContuniState();
}

class _RegisterToContuniState extends State<RegisterPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      child: buildImage(
                        "asset/images/register_continue.png",
                      ),
                    ),
                  ),
                  Positioned(
                    top: 260,
                    child: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40),
                              topRight: const Radius.circular(40))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildUserInfoStructure(
                                context, Icons.navigate_before, 'Name'),
                            buildUserInfoStructure(context,
                                Icons.navigate_before, 'Email or phone number'),
                            buildUserInfoStructure(context,
                                Icons.navigate_before, 'Date of birth'),
                            buildUserInfoStructure(
                                context, Icons.navigate_before, 'Password'),
                            buildTermsInfo(),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: CustomButton(
                                    text: 'Register',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPasswordPage()),
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  Row buildTermsInfo() {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.grey,
          value: this.value,
          onChanged: (value) {
            setState(() {
              this.value = (value)!;
            });
          },
        ), //Checkbox
        Text('I agrre with the'),
        TextButton(
            onPressed: () {},
            child: Text(
              'Terms of service',
              style: TextStyle(fontSize: 13),
            )),
        Text('&pivacy policy'),
      ],
    );
  }
}
