import 'package:celebi_project/pages/login_screens/custom/image_with_white_button.dart';
import 'package:celebi_project/pages/login_screens/register_continue/form/register_form.dart';
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
                children: [
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
                        padding: EdgeInsets.only(right: 20, left: 20, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegisterForm(),
                            buildTermsInfo(),
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
