import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/login_screens/check_email/check_email.dart';
import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/image_with_blue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/user_info_structure.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  bool isVisible = false;
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

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
                      'Create New Password',
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
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFB6DAE6).withOpacity(0.2),
                          filled: true,
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
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.teal[200],
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB6DAE6)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Old password',
                          hintStyle: context.textTheme.bodyText2!
                              .copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFB6DAE6).withOpacity(0.2),
                          filled: true,
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
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.teal[200],
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB6DAE6)),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'New password',
                          hintStyle: context.textTheme.bodyText2!
                              .copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFB6DAE6).withOpacity(0.2),
                          filled: true,
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
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.teal[200],
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFB6DAE6),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Repeat new password',
                          hintStyle: context.textTheme.bodyText2!
                              .copyWith(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.15,
                ),
                buildContinueButton('Send', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckEmailView()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
