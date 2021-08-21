import 'package:celebi_project/pages/login_screens/custom/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class ForgetForm extends StatefulWidget {
  const ForgetForm({Key? key}) : super(key: key);

  @override
  _ForgetFormState createState() => _ForgetFormState();
}

TextEditingController forgetPassController = TextEditingController();

class _ForgetFormState extends State<ForgetForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(top: 40, right: 30, left: 30, bottom: 40),
        child: Column(
          children: [
            buildNameField(context),
            SizedBox(height: 30),
            CustomButton(
                onPressed: () {
                  final String forgetEmail = forgetPassController.text;
                  if (formKey.currentState!.validate()) {}
                },
                text: "Send"),
          ],
        ),
      ),
    );
  }
}

TextFormField buildNameField(BuildContext context) {
  return TextFormField(
    controller: forgetPassController,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.markunread,
        color: Colors.teal[200],
      ),
      hintText: 'Email',
      hintStyle: context.textTheme.bodyText2!
          .copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}
