import 'package:celebi_project/pages/auth/login_main_page/login_main_page.dart';
import 'package:celebi_project/pages/main/home/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/lang/locale_keys.g.dart';
import '../../../services/auth_service.dart';
import '../custom/custom_button.dart';
import '../custom/image_with_blue_button.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({Key? key}) : super(key: key);

  @override
  _CheckEmailViewState createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<bool>(
            stream: AuthService().isEmailVerified().asStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data == true) {
                    Center(
                      child: Text('email is verified'),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        buildForgetPasswordImage(
                          "asset/images/forget_password.png",
                        ),
                        Text(
                          LocaleKeys.check_email_title.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              LocaleKeys.check_email_content,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey,
                                  height: 1.5),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        CustomButton(
                            text: 'Back To Login Page',
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginMainPage()), (route) => false);
                            }),
                        Spacer()
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
