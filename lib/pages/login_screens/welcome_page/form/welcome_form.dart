import 'package:celebi_project/pages/login_screens/custom/custom_button.dart';
import 'package:celebi_project/pages/login_screens/welcome_page/components/forget_password_button.dart';
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final String welcomeEmail = emailController.text;
                      final String welcomePassword = passwordController.text;
                    }
                  }),
            ],
          ),
        ));
  }

  TextFormField buildEmailField(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        //contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
