import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firestore_service.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final _gooleSignIn = GoogleSignIn();
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> setValuesFromGoogle() async {
    User? _currentUser = getCurrentUser();
    await FirestoreService().saveNewUserData(
        user: _currentUser!,
        username: _currentUser.displayName!,
        dateOfBirth: '15/10/2000');
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required String username,
      required String dateOfBirth}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirestoreService().saveNewUserData(
          user: _auth.currentUser!,
          username: username,
          dateOfBirth: dateOfBirth);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> sendPasswordResetMail(String email) async { 

    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String?> signInWithGoogle() async {
    print("1");
    GoogleSignInAccount? _googleSignInAccount = await _gooleSignIn.signIn();
    print("2");
    if (_googleSignInAccount != null) {
      print("3");
      try {
        GoogleSignInAuthentication _googleSignInAuthentication =
            await _googleSignInAccount.authentication;

        AuthCredential _credential = GoogleAuthProvider.credential(
          idToken: _googleSignInAuthentication.idToken,
          accessToken: _googleSignInAuthentication.accessToken,
        );
        await _auth.signInWithCredential(_credential);
        return "Signed In With Google";
      } on FirebaseAuthException catch (e) {
        print("there is an error");
        return e.message;
      }
    }
    return "";
  }

  Future<void> sendEmailVerification() async {
    User? _user = _auth.currentUser;
    await _user!.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User? _user = _auth.currentUser;
    return _user!.emailVerified;
  }
}
