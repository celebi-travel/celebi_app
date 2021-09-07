import 'package:celebi_project/constants/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../custom/custom_button.dart';
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
                text: LocaleKeys.forget_password_send.tr()),
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
      hintText: LocaleKeys.forget_password_email.tr(),
      hintStyle: context.textTheme.bodyText2!
          .copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}

TextButton backToLoginButton() {
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.only(top: 250),
      child: Text(
        LocaleKeys.forget_password_back_to_login.tr(),
        style: TextStyle(color: Color(0xFF7BC4B2)),
      ),
    ),
  );
}
