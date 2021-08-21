import 'package:celebi_project/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import 'components/otp_form.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.height * 0.1),
              Text(
                "Enter your 4 digit code",
                style: TextStyle(fontSize: 22),
              ),
              // buildTimer(),
              OtpForm(),
              SizedBox(height: context.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, double value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
