import 'package:celebi_project/pages/login_screens/custom/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../extensions/context_extension.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _WelcomeBackFormState createState() => _WelcomeBackFormState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _WelcomeBackFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            buildNameField(context),
            SizedBox(height: 20),
            buildEmailField(context),
            SizedBox(height: 20),
            buildDateField(context),
            SizedBox(height: 20),
            buildPasswordField(context),
            SizedBox(height: 20),
            CustomButton(
                text: 'Register',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final String name = nameController.text;
                    final String date = dateController.text;
                    final String email = emailController.text;
                    final String password = passwordController.text;
                  }
                })
          ],
        ));
  }

  TextFormField buildNameField(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        //contentPadding: EdgeInsets.symmetric(horizontal: 10),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.navigate_before,
            color: Colors.teal[200],
          ),
        ),
        hintText: 'Name',
        hintStyle: context.textTheme.bodyText2!
            .copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}

TextFormField buildEmailField(BuildContext context) {
  return TextFormField(
    controller: emailController,
    decoration: InputDecoration(
      //contentPadding: EdgeInsets.symmetric(horizontal: 10),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.navigate_before,
          color: Colors.teal[200],
        ),
      ),
      hintText: 'Email or phone number',
      hintStyle: context.textTheme.bodyText2!
          .copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}

TextFormField buildDateField(BuildContext context) {
  return TextFormField(
    controller: dateController,
    decoration: InputDecoration(
      //contentPadding: EdgeInsets.symmetric(horizontal: 10),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.navigate_before,
          color: Colors.teal[200],
        ),
      ),
      hintText: 'Date of birth',
      hintStyle: context.textTheme.bodyText2!
          .copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}

TextFormField buildPasswordField(BuildContext context) {
  return TextFormField(
    controller: passwordController,
    decoration: InputDecoration(
      //contentPadding: EdgeInsets.symmetric(horizontal: 10),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.navigate_before,
          color: Colors.teal[200],
        ),
      ),
      hintText: 'Password',
      hintStyle: context.textTheme.bodyText2!
          .copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}
