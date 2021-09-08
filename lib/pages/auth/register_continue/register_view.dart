import 'package:flutter/material.dart';

import '../custom/image_with_white_button.dart';
import 'form/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterToContuniState createState() => _RegisterToContuniState();
}

class _RegisterToContuniState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildImage(
                    "asset/images/register_continue.png",
                  ),
                ],
              ),
              Positioned(
                top: 220,
                child: Container(
                  height: 700,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
