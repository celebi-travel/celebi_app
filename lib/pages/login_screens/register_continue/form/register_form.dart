import 'package:celebi_project/pages/login_screens/check_email/check_email.dart';
import 'package:celebi_project/pages/login_screens/custom/custom_button.dart';
import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:celebi_project/services/auth_service.dart';
import 'package:celebi_project/services/firestore_service.dart';
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
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
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
              onPressed: () async {
                if (formKey.currentState!.validate() && value) {
                  final String name = nameController.text;
                  final String date = dateController.text;
                  final String email = emailController.text;
                  final String password = passwordController.text;

                  String? result = await AuthService().signUp(email: email, password: password, username: name, dateOfBirth: date);
                  if (result == 'Signed up') {
                    AuthService().sendEmailVerification();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckEmailView()));
                  }
                }
              }),
          Row(
            children: [
              Checkbox(
                activeColor: Color(0xFFB6DAE6),
                value: this.value,
                onChanged: (value) {
                  setState(() {
                    this.value = (value)!;
                  });
                },
              ), //Checkbox
              Text('I agrre with the'),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Terms of service',
                    style: TextStyle(fontSize: 13),
                  )),
              Text('&pivacy policy'),
            ],
          ),
        ],
      ),
    ));
  }

  TextFormField buildNameField(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Lütfen bu alanı doldurunuz';
        }
      },
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
        hintStyle: context.textTheme.bodyText2!.copyWith(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}

TextFormField buildEmailField(BuildContext context) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: emailController,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Lütfen bu alanı doldurunuz';
      }
      if (!value.contains('@') || !value.contains('.com')) {
        return 'Lütfen geçerli bir e-posta giriniz';
      }
    },
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
      hintStyle: context.textTheme.bodyText2!.copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}

TextFormField buildDateField(BuildContext context) {
  return TextFormField(
    controller: dateController,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Lütfen bu alanı doldurunuz';
      }
      if (!value.contains('/')) {
        return 'Lütfen bu alanı doldurunuz';
      }
    },
    keyboardType: TextInputType.datetime,
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
      hintStyle: context.textTheme.bodyText2!.copyWith(color: Colors.grey, fontSize: 18),
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
      if (value.characters.length < 6) {
        return 'Şifre en az 6 karakterli olmalıdır';
      }
    },
    keyboardType: TextInputType.visiblePassword,
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
      hintStyle: context.textTheme.bodyText2!.copyWith(color: Colors.grey, fontSize: 18),
    ),
  );
}
