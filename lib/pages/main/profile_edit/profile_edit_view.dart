import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebi_project/services/auth_service.dart';
import 'package:celebi_project/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../extensions/context_extension.dart';
import '../../auth/custom/custom_button.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  _ProfileEditViewState createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  late String username;
  late String email;

  bool nameGet = false;

  late User currentUser;

  String profilePicUrl = 'https://cdn-icons-png.flaticon.com/512/747/747376.png';

  bool profilePicget = false;

  Future<void> getProfilePic() async {
    profilePicUrl = await FirestoreService().getProfilePicture();
     
    profilePicget = true;
    setState(() {});
  }

  Future<void> getusername() async {
    username = await FirestoreService().getCurrentUsersUsername();
    currentUser = (AuthService().getCurrentUser())!;
    email = (currentUser.email)!;
    nameGet = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getusername().then((value) => getProfilePic());
  }
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(backgroundColor: Color(0xFF7BC4B2),
                      child:   CachedNetworkImage(
                     imageUrl:   profilePicUrl != 'error'  ? profilePicUrl : 'https://cdn-icons-png.flaticon.com/512/747/747376.png'),
                      radius: 100,
                    ),
                  ),
                  Positioned( bottom: 4,right:4,
                    child: CircleAvatar(child: IconButton(onPressed: (){
                      
                    }, icon: Icon(Icons.camera_alt_rounded))))
                ],
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
                          hintText: username,
                          labelText: 'Full Name:',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Divider(height: context.highValue * 0.5),
                    TextFormField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: email,
                          labelText: 'Email:',
                          labelStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ), 
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
