import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';

import '../../../constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../extensions/context_extension.dart';
import '../../../services/auth_service.dart';
import '../../../widgets/login_buttons.dart';
import '../welcome_page/welcome_view.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({Key? key}) : super(key: key);

  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Container(
                color: Colors.white,
                child:
                    Image.asset('asset/images/login.png', fit: BoxFit.contain),
              ),
              Spacer(),
              Text(LocaleKeys.login1_title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline2!
                          .copyWith(color: Colors.black, fontSize: 30))
                  .tr(),
              Spacer(),
              Text(LocaleKeys.login1_subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline5!.copyWith(
                    color: Colors.blueGrey[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )).tr(),
              Spacer(),
              LoginButton(
                name: LocaleKeys.login1_googlebtn.tr(),
                imagePath: 'asset/icons/google.png',
                color: Color(0xff1A81F3),
                avatarColor: Colors.white.withOpacity(0.15),
                onPressed: () async {
                  String? result = await AuthService().signInWithGoogle();
                  if (result == 'Signed In With Google') {
                    await AuthService().setValuesFromGoogle();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  }
                  print('result = $result');
                },
              ),
              LoginButton(
                name: LocaleKeys.login1_mailbtn.tr(),
                imagePath: 'asset/icons/email.png',
                color: Colors.grey[200]!,
                avatarColor: Color(0xff1A81F3),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WelcomeBackPage()));
                },
                textColor: Colors.grey,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
