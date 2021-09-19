import '../../../constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../custom/image_with_blue_button.dart';
import 'form/forget_form.dart';

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
                LocaleKeys.forget_password_title.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    LocaleKeys.forget_password_subtitle.tr(),
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ForgetForm(),
              backToLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
