import 'package:flutter/material.dart';
import '../../../extensions/context_extension.dart';
import '../check_email/check_email.dart';
import '../custom/custom_button.dart';
import '../custom/image_with_blue_button.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildForgetPasswordImage(
                      "asset/images/forget_password.png",
                    ),
                    Text(
                      'Change New Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Your new password must be different from previously passwords.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                ChangePasswordForm(),
                SizedBox(
                  height: context.height * 0.05,
                ),
                SizedBox(
                  height: context.height * 0.15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

TextEditingController oldPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController repeatPasswordController = TextEditingController();

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildOldPasswordField(context),
          SizedBox(height: 20),
          buildNewPasswordField(context),
          SizedBox(height: 20),
          repeatPasswordField(context),
          SizedBox(height: context.height * 0.2),
          CustomButton(
              text: 'Register',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final String oldPassword = oldPasswordController.text;
                  final String newPassword = newPasswordController.text;
                  final String repeatPassword = repeatPasswordController.text;
                  print(oldPassword);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckEmailView()));
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildOldPasswordField(BuildContext context) {
    return TextFormField(
      controller: oldPasswordController,
      obscureText: !isVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.mail,
            color: Colors.teal[200],
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        hintText: 'Old password',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }

  TextFormField buildNewPasswordField(BuildContext context) {
    return TextFormField(
      controller: newPasswordController,
      obscureText: !isVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.mail,
            color: Colors.teal[200],
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        hintText: 'New password',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }

  TextFormField repeatPasswordField(BuildContext context) {
    return TextFormField(
      controller: repeatPasswordController,
      obscureText: !isVisible,
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.mail,
            color: Colors.teal[200],
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
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
        hintText: 'Repeat new password',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}
