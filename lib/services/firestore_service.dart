import 'package:celebi_project/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveHoteData({required Hotel hotel}) async {
    await _firestore.collection('hotels').doc(hotel.uid).set(
      {'uid': user.uid, 'email': user.email, 'username': username, 'dateOfBirth': dateOfBirth},
    );
  }
  Future<void> saveNewUserData({required User user, required String username, required String dateOfBirth}) async {
    await _firestore.collection('users').doc(user.uid).set(
      {'uid': user.uid, 'email': user.email, 'username': username, 'dateOfBirth': dateOfBirth},
    );
  }

  Future<String> getCurrentUsersUsername() async {
    User? _user = AuthService().getCurrentUser();
    DocumentSnapshot snapshot = await _firestore.collection('users').doc(_user!.uid).get();
    return snapshot.get('username');
  }

  Future<void> changeUsername(String newUsername) async {
    User _user = AuthService().getCurrentUser()!;
    await _firestore.collection('users').doc(_user.uid).update({'username': newUsername});
  }

  Future<void> deleteUser(String uid) async {
    await _firestore.collection('users').doc(uid).delete();
  }

  Future<String> getUsernameByUID(String uid) async {
    QuerySnapshot _querySnapshot = await _firestore.collection('users').where('uid', isEqualTo: uid).get();
    return (_querySnapshot.docs.first.data() as Map)['username'];
  }
}
