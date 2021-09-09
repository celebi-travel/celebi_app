import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/auth/custom/custom_button.dart';
import 'package:flutter/material.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Back',
          style: context.textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.1,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                  child: Image.network(
                      'https://pbs.twimg.com/profile_images/991832743439994880/km5_AHDq_400x400.jpg'),
                  radius: 100,
                ),
              ),
              SizedBox(
                height: context.height * 0.1,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Naralie Gardnerson',
                          labelText: 'Full Name:',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(height: context.highValue * 0.5),
                    TextFormField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'info@celebi.com.tr',
                          labelText: 'Email:',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(height: context.highValue * 0.5),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Please enter',
                          labelText: 'Password:',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: context.width * 0.4,
                      child: CustomButton(onPressed: () {}, text: 'Cancel')),
                  SizedBox(
                      width: context.width * 0.4,
                      child: CustomButton(onPressed: () {}, text: 'Save All')),
                ],
              ),
              SizedBox(
                height: context.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
