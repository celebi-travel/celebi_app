import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/login_screens/custom/continue_button.dart';
import 'package:celebi_project/pages/login_screens/custom/custom_button.dart';
import 'package:celebi_project/pages/main/profile/proflle_view.dart';
import 'package:celebi_project/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late TextEditingController pin1Controller;
  late TextEditingController pin2Controller;
  late TextEditingController pin3Controller;
  late TextEditingController pin4Controller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    pin1Controller = TextEditingController();
    pin2Controller = TextEditingController();
    pin3Controller = TextEditingController();
    pin4Controller = TextEditingController();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void backField(String value, FocusNode focusNode) {
    if (value.length == 0) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (60),
                child: TextFormField(
                  maxLength: 1,
                  controller: pin1Controller,
                  focusNode: pin1FocusNode,
                  buildCounter: (context,
                          {int? currentLength, bool? isFocused, maxLength}) =>
                      null,
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin2FocusNode.requestFocus();
                      // Then you need to check is the code is correct or not
                    } else {
                      backField(value, pin1FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: (60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  maxLength: 1,
                  controller: pin2Controller,
                  buildCounter: (context,
                          {int? currentLength, bool? isFocused, maxLength}) =>
                      null,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin3FocusNode.requestFocus();
                      // Then you need to check is the code is correct or not
                    } else {
                      backField(value, pin1FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: (60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  maxLength: 1,
                  controller: pin3Controller,
                  buildCounter: (context,
                          {int? currentLength, bool? isFocused, maxLength}) =>
                      null,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode.requestFocus();
                      // Then you need to check is the code is correct or not
                    } else {
                      backField(value, pin2FocusNode);
                    }
                  },
                ),
              ),
              SizedBox(
                width: (60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  controller: pin4Controller,
                  maxLength: 1,
                  buildCounter: (context,
                          {int? currentLength, bool? isFocused, maxLength}) =>
                      null,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    } else {
                      backField(value, pin3FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: context.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Did you don\'t code? '),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Please resend',
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
          CustomButton(
            text: "Verify",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String code = "";
                code += pin1Controller.text;
                code += pin2Controller.text;
                code += pin3Controller.text;
                code += pin4Controller.text;
                showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                      height: 200,
                      content: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: ClipRRect(
                              child: Image.asset(
                                  'asset/images/forget_password.png'),
                            ),
                          ),
                          Spacer(flex: 2),
                          Text(
                            'Has been verified',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(flex: 1),
                          Text(
                            'You have succesfully verified your account',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Spacer(flex: 2),
                          AlertDialogButton(
                            text: 'Home Page',
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            onPressed: () {},
                          )
                        ],
                      )),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: (15)),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular((15)),
    borderSide: BorderSide(color: Colors.white12),
  );
}
