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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 150, 10, 10),
              child: Container(
                height: 180,
                width: 180,
                color: Colors.white,
                child: Image.asset('asset/images/login.png', fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: Text('Get connect to the best Mentors',
                  textAlign: TextAlign.center, style: context.textTheme.bodyText1!.copyWith(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: Text('Easy way to conenct to mentor and get advise solution of design.',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyText1!.copyWith(fontSize: 18, color: Colors.blueGrey[400], fontWeight: FontWeight.w400)),
            ),
            Column(
              children: [
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeBackPage()));
                  },
                  textColor: Colors.grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
