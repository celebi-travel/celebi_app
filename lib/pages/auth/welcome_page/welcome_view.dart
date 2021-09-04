import 'package:flutter/material.dart';

import '../custom/image_with_white_button.dart';
import '../register_continue/register_view.dart';
import 'form/welcome_form.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  _WecomeBackPageState createState() => _WecomeBackPageState();
}

class _WecomeBackPageState extends State<WelcomeBackPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildImage(
                "asset/images/welcome_back.png",
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 80),
                  child: WelcomeBackForm(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Text("Don't have an account?",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 25)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'Sign up',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
