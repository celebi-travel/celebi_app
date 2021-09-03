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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              Text('Get connect to the best Mentors',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline2!
                      .copyWith(color: Colors.black)),
              Spacer(),
              Text(
                  'Easy way to conenct to mentor and get advise solution of design.',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline5!.copyWith(
                      color: Colors.blueGrey[400],
                      fontWeight: FontWeight.w400)),
              Spacer(),
              LoginButton(
                name: 'Login with Google',
                imagePath: 'asset/icons/google.png',
                color: Color(0xff1A81F3),
                avatarColor: Colors.white.withOpacity(0.15),
                onPressed: () async {
                  String? result = await AuthService().signInWithGoogle();
                  print('result = $result');
                },
              ),
              LoginButton(
                name: 'Login with Email',
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
