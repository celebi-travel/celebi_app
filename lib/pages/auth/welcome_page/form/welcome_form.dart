import '../../../main/bottom_nav_bar/bottom_nav_bar.dart';

import '../../custom/custom_button.dart';
import '../components/forget_password_button.dart';
import '../../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class WelcomeBackForm extends StatefulWidget {
  const WelcomeBackForm({Key? key}) : super(key: key);

  @override
  _WelcomeBackFormState createState() => _WelcomeBackFormState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _WelcomeBackFormState extends State<WelcomeBackForm> {
  final formKey = GlobalKey<FormState>();
  bool isVisible = false;
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              buildEmailField(context),
              SizedBox(height: 20),
              buildPasswordField(context),
              buildForgetPasswordButton(),
              SizedBox(height: 60),
              CustomButton(
                  text: 'Login',
                  onPressed: () async {
                    print('clicked');
                    if (formKey.currentState!.validate()) {
                      print('valdiated');
                      final String email = emailController.text;
                      final String password = passwordController.text;

                      String? result = await AuthService()
                          .signIn(email: email, password: password);
                      print('result = $result');
                      if (result == 'Signed in') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavBar()));
                      }
                    }
                  }),
            ],
          ),
        ));
  }

  TextFormField buildEmailField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Lütfen bu alanı doldurunuz';
        }
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.markunread,
            color: Colors.teal[200],
          ),
        ),
        hintText: 'Email or username',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }

  TextFormField buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Lütfen bu alanı doldurunuz';
        }
      },
      obscureText: !isVisible,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.lock,
            color: Colors.teal[200],
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              changeVisibility();
            },
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.teal[200],
            ),
          ),
        ),
        hintText: 'Password',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}
